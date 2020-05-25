//
//  AzureADHandler.swift
//  Fleet Tracker
//
//  Created by Sandip Mahajan on 06/12/19.
//  Copyright © 2019 Mobiliya. All rights reserved.
//

import UIKit
import MSAL

class AzureADHandler: NSObject {
    
    // Microsoft Azure Active Directory
    // Update the below to your client ID you received in the portal. The below is for running the demo only

   let kClientID = "46ef45fa-dc03-45e0-a709-e16e0c9df6a6"
    
    // Additional variables for Auth and Graph API
    let kGraphURI = "https://graph.microsoft.com/v1.0/me/"
   // let kScopes: [String] = ["https://graph.microsoft.com/user.read"]
    
    let kScopes: [String] = ["46ef45fa-dc03-45e0-a709-e16e0c9df6a6/user.read"]
    
    
   // let kAuthority = "https://login.microsoftonline.com/common"
    
  
    let kAuthority = "https://login.microsoftonline.com/b3e5db5e-2944-4837-99f5-7488ace54319"
    
    // Variables
    var accessToken = String()
    var applicationContext : MSALPublicClientApplication?
    var webViewParamaters : MSALWebviewParameters?
    var delegate : MSALUserDelegate?
    /**
     Initialize a MSALPublicClientApplication with a given clientID and authority
     
     - clientId:            The clientID of your application, you should get this from the app portal.
     - redirectUri:         A redirect URI of your application, you should get this from the app portal.
     If nil, MSAL will create one by default. i.e./ msauth.<bundleID>://auth
     - authority:           A URL indicating a directory that MSAL can use to obtain tokens. In Azure AD
     it is of the form https://<instance/<tenant>, where <instance> is the
     directory host (e.g. https://login.microsoftonline.com) and <tenant> is a
     identifier within the directory itself (e.g. a domain associated to the
     tenant, such as contoso.onmicrosoft.com, or the GUID representing the
     TenantID property of the directory)
     - error                The error that occurred creating the application object, if any, if you're
     not interested in the specific error pass in nil.
     */
    func initMSAL(controller viewController: UIViewController) throws {
        
        guard let authorityURL = URL(string: kAuthority) else {
            print("Unable to create authority URL")
            return
        }
        
        let authority = try MSALAADAuthority(url: authorityURL)
        
        let msalConfiguration = MSALPublicClientApplicationConfig(clientId: kClientID, redirectUri: nil, authority: authority)
        self.applicationContext = try MSALPublicClientApplication(configuration: msalConfiguration)
        
        self.webViewParamaters = MSALWebviewParameters(parentViewController: viewController)
        
        guard let currentAccount = self.currentAccount() else {
            // We check to see if we have a current logged in account.
            // If we don't, then we need to sign someone in.
            acquireTokenInteractively()
            return
        }
        
        acquireTokenSilently(currentAccount)
    }
    
    func currentAccount() -> MSALAccount? {
        
        guard let applicationContext = self.applicationContext else { return nil }
        
        // We retrieve our current account by getting the first account from cache
        // In multi-account applications, account should be retrieved by home account identifier or username instead
        
        do {
            
            let cachedAccounts = try applicationContext.allAccounts()
            
            if !cachedAccounts.isEmpty {
                return cachedAccounts.first
            }
            
        } catch let error as NSError {
            
            print("Didn't find any accounts in cache: \(error)")
        }
        
        return nil
    }
    
    func acquireTokenInteractively() {
        
        guard let applicationContext = self.applicationContext else { return }
        guard let webViewParameters = self.webViewParamaters else { return }
        
        let parameters = MSALInteractiveTokenParameters(scopes: kScopes, webviewParameters: webViewParameters)
        parameters.promptType = .selectAccount;
        
        applicationContext.acquireToken(with: parameters) { (result, error) in
            
            if let error = error {
                
                print("@@@Could not acquire token: \(error)")
                return
            }
            
            guard let result = result else {
                
                print("@@@Could not acquire token: No result returned")
                return
            }
            
            self.accessToken = result.accessToken
            print(self.accessToken)
            self.getContentWithToken()
        }
    }
    
    func acquireTokenSilently(_ account : MSALAccount!) {
        
        guard let applicationContext = self.applicationContext else { return }
        
        /**
         
         Acquire a token for an existing account silently
         
         - forScopes:           Permissions you want included in the access token received
         in the result in the completionBlock. Not all scopes are
         guaranteed to be included in the access token returned.
         - account:             An account object that we retrieved from the application object before that the
         authentication flow will be locked down to.
         - completionBlock:     The completion block that will be called when the authentication
         flow completes, or encounters an error.
         */
        
        let parameters = MSALSilentTokenParameters(scopes: kScopes, account: account)
        
        applicationContext.acquireTokenSilent(with: parameters) { (result, error) in
            
            if let error = error {
                
                let nsError = error as NSError
                
                // interactionRequired means we need to ask the user to sign-in. This usually happens
                // when the user's Refresh Token is expired or if the user has changed their password
                // among other possible reasons.
                
                if (nsError.domain == MSALErrorDomain) {
                    
                    if (nsError.code == MSALError.interactionRequired.rawValue) {
                        
                        DispatchQueue.main.async {
                            self.acquireTokenInteractively()
                        }
                        return
                    }
                }
                
                print("Could not acquire token silently: \(error)")
                return
            }
            
            guard let result = result else {
                
                print("Could not acquire token: No result returned")
                return
            }
            
            self.accessToken = result.accessToken
            print(self.accessToken)
            self.getContentWithToken()
        }
    }
    
    /**
     This will invoke the call to the Microsoft Graph API. It uses the
     built in URLSession to create a connection.
     */
    
    func getContentWithToken() {
        
        // Specify the Graph API endpoint
        let url = URL(string: kGraphURI)
        var request = URLRequest(url: url!)
        
        // Set the Authorization header for the request. We use Bearer tokens, so we specify Bearer + the token we got from the result
        request.setValue("Bearer \(self.accessToken)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Couldn't get graph result: \(error)")
                return
            }
            if let jsonString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as String? {
                let result = MSALUserModel.self.deserialize(from: jsonString)
                _ = KeychainService.save(key: AUTH_TOKEN, data: self.accessToken.data(using: .utf8)! as NSData)
                self.delegate?.response(isSuccess: true, error: "", data: result)
            }
            else {
                print("Couldn't deserialize result JSON")
            }
        }.resume()
    }
    
    func signOut() {
        
        guard let applicationContext = self.applicationContext else { return }
        
        guard let account = self.currentAccount() else { return }
        
        do {
            /**
             Removes all tokens from the cache for this application for the provided account
             - account:    The account to remove from the cache
             */
            try applicationContext.remove(account)
            self.accessToken = ""
            _ = KeychainService.delete(key: AUTH_TOKEN)
        } catch let error as NSError {
            print("Received error signing account out: \(error)")
        }
    }
}
