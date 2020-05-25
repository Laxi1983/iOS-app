//
//  UserModel.swift
//  Fleet Tracker
//
//  Created by Ritesh Gupta on 18/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON


class UserModel: HandyJSON {
    var UserID:Int?
    var Name:String?
    var Email:String??
    var MobileNumber:String?
    var Password:String??
    var TenantCode:String?
    var RoleId:Int?
    var TenantId:Int?
    var Status:Int?
    var UpdateBy:Int?
    var FleetList:[Any]?
    var Vehicle:String?
    var TenantName:String?
    var PowerBIs:String?
    var CountryCode:String?
    var CountryLatitude:Double?
    var CountryLongitude:Double?
   
    
   required init() {
       
   }

}
