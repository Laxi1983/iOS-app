//
//  GetUserModel.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 01/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class GetUserModel: HandyJSON {
    
    var  UserID: Int?
    var Name: String?
    var  Email: String?
    var MobileNumber: String?
    var Password: String?
    var TenantCode: String?
    var RoleId: Int?
    var  TenantId:Int?
    var Status: Int?
    var UpdateBy: Int?
    var  FleetList: [Any]?
    var Vehicle: String?
    var TenantName: String?
    var PowerBIs: String?
    var CountryCode: String?
    var CountryLatitude: Int?
    var  CountryLongitude: Int?
    
    required init() {
        
    }
}
