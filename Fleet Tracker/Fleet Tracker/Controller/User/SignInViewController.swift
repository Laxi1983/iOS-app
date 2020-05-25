//
//  MyViewController.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 28/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import UIKit
import MSAL
import JWTDecode

class SignInViewController: BaseViewController {
    
    
     var userManager = UserManager.shared
    
    @IBOutlet weak var ImageCollectionView: UICollectionView!
    
    
    
    @IBOutlet weak var signInButton: UIButton!
    
    var currentPageNumber:Int = 0
    var numberOfPages:Int = 5
    var pageNumber:Int = 0
    var arr:[UIImage] = []
    var adHandler = AzureADHandler()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userManager.userDelegate = self
        adHandler.delegate = self
        ImageCollectionView.dataSource = self
        ImageCollectionView.delegate = self
        arr.append(UIImage(named: "Image1")!)
        arr.append(UIImage(named: "Image2")!)
        arr.append(UIImage(named: "Image3")!)
        arr.append(UIImage(named: "Image4")!)
        startTimer()
        
    }
    
    
    
    func startTimer() {
        
        let timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(scrollToNextCell), userInfo: nil, repeats: true);
        
    }
    
    
    @objc func scrollToNextCell(){
        
        if currentPageNumber == numberOfPages  {
            currentPageNumber = 0
        }
        print("### currentPageNumber \(currentPageNumber)")
        
        ImageCollectionView.scrollToItem(at: IndexPath(row: currentPageNumber, section: 0), at: .right, animated: true)
        currentPageNumber += 1
        //pageNumber = currentPageNumber
        
        
        
    }
    
    
    
    
    
    
    @IBAction func signInButtonClicked(_ sender: Any) {
         BaseViewController.addActivitiIndicaterView()
         try? adHandler.initMSAL(controller: self)
        
       
    }
    
}






extension SignInViewController : UserDelegate, MSALUserDelegate {
    
    
    
    func response(isSuccess: Bool, error: String, data: MSALUserModel?) {
        if isSuccess {
           
            do{
                let jwt = try decode(jwt: String(data: KeychainService.load(key: AUTH_TOKEN)! as Data, encoding: .utf8) ?? "")
               
                let mail = jwt.claim(name: "unique_name")
                let password:String = data!.password!
                let displayName = jwt.claim(name: "name")
                let id = jwt.claim(name: "oid")
                
                
                let userData = MSALUserModel(mail:mail.string! , displayName: displayName.string!, password: password, id: id.string!)
                
                let loginRequest = LoginRequest(from: userData)
               
                userManager.login(from: loginRequest.toJSON()!)
            }catch{
                
            }
        }
        else {
            print(error)
        }
    }
    
    func loginResponse(isSuccess: Bool, error: String?, data: UserResponse?) {
        if data != nil{
           let jsonData = data!.toJSON()
        print("### in loginResponse data = \(jsonData)")

        let json = try? JSONSerialization.data(withJSONObject:jsonData)
        if let jsonString = NSString(data: json!, encoding: String.Encoding.utf8.rawValue) as String? {
            UserDefaults.standard.set(jsonString,forKey:UserInfo)
            if let object = UserResponse.deserialize(from: jsonString) {
                if let finalData = object.data
                {
                    UserManager.shared.user = finalData
//                    UserDefaults.standard.set(finalData.UserID, forKey:UserID )
//                    UserDefaults.standard.set(finalData.TenantName, forKey:TenantName )
//                    UserDefaults.standard.set(finalData.FleetList, forKey:FleetList )
//                    UserDefaults.standard.set(finalData.UpdateBy, forKey:UpdateBy )
//                    UserDefaults.standard.set(finalData.RoleId, forKey:RoleId )
//                    UserDefaults.standard.set(finalData.CountryLatitude, forKey:CountryLatitude )
//                    UserDefaults.standard.set(finalData.CountryCode, forKey:CountryCode )
//                    UserDefaults.standard.set(finalData.TenantCode, forKey:TenantCode )
//                    UserDefaults.standard.set(finalData.CountryLongitude, forKey:CountryLongitude )
//                    UserDefaults.standard.set(finalData.MobileNumber, forKey:MobileNumber )
//                    UserDefaults.standard.set(finalData.TenantId, forKey:TenantId )
//                    UserDefaults.standard.set(finalData.Password, forKey:Password )
//                    UserDefaults.standard.set(finalData.Email, forKey:Email )
//                    UserDefaults.standard.set(finalData.Name, forKey:Name )
//                    UserDefaults.standard.set(finalData.Status, forKey:Status )
//                    UserDefaults.standard.set(finalData.PowerBIs, forKey:PowerBIs )
//                    UserDefaults.standard.set(finalData.Vehicle, forKey:Vehicle )
                }
                
                if object.status == 0 {
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        if let tabBarController = GUIService.shared.showMainTabBarController() {
                            self.present(tabBarController, animated: true, completion: nil)
                        }
                    }
                }
            }
        }
        
        }
    }
    
    func RoleBasedUserCountResponse(isSuccess: Bool, error: String?, data: RoleBasedUserCountResponse?) {
    }
    
    
    func usersResponse(isSuccess: Bool, error: String?, data: GetUserResponse?) {
       
    }
    
    
}








extension SignInViewController:UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ImageCollectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.imageView.image = arr[indexPath.row]
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let cell = ImageCollectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        //cell.pageControl.currentPage = indexPath.row
        cell.pageControl.isHidden = true
        // currentPageNumber = indexPath.row
        print("### indexPath.row \(indexPath.row)")
    }
}

extension SignInViewController:UICollectionViewDelegate
{
    
}
