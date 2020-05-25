//
//  KeychainService.swift
//  Fleet Tracker
//
//  Created by Sandip Mahajan on 05/12/19.
//  Copyright © 2019 Mobiliya. All rights reserved.
//

import UIKit

class KeychainService: NSObject {
    
    //MARK: function for Saving Data in keychain
    public static func save(key: String, data: NSData) -> Bool {
        
        let query = [kSecClass as String : kSecClassGenericPassword as String, kSecAttrAccount as String : key, kSecValueData as String : data] as [String : Any];
        SecItemDelete(query as CFDictionary);
        
        let status: OSStatus = SecItemAdd(query as CFDictionary, nil);
        return status == noErr;
    }
    
    //MARK: function for Loading Data in keychain
    public static func load(key: String) -> NSData? {
        
        let query = [kSecClass as String : kSecClassGenericPassword, kSecAttrAccount as String : key, kSecReturnData as String : kCFBooleanTrue as Any, kSecMatchLimit as String : kSecMatchLimitOne] as [String : Any];
        
        var dataTypeRef: AnyObject?;
        let status = withUnsafeMutablePointer(to: &dataTypeRef) {
            
            SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0));
        }
        
        if status == errSecSuccess {
            
            if let data = dataTypeRef as! NSData? {
                
                return data;
            }
        }
        
        let blank : String = "";
        return blank.data(using: String.Encoding.utf8) as NSData?;
    }
    
    //MARK: function for delete key and reaponding Data in keychain
    public static func delete(key: String) -> Bool {
        
        let query = [kSecClass as String : kSecClassGenericPassword, kSecAttrAccount as String : key] as [String : Any];
        
        let status: OSStatus = SecItemDelete(query as CFDictionary);
        return status == noErr;
    }
    
    //MARK: function for clear all the data
    public static func clear() -> Bool {
        
        let query = [kSecClass as String : kSecClassGenericPassword];
        
        let status: OSStatus = SecItemDelete(query as CFDictionary);
        return status == noErr;
    }
}
