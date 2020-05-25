//
//  TenantAdminFleetListModel.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 03/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class TenantAdminFleetListModel: HandyJSON {
 
   var Id: Int?
   var Name: String?
   var Description: String?
   var UpdatedTime: String?
   var UpdatedBy: Int?
   var VehicleCount:Int?
   var AssociatedUser: [GetUserModel]?
    
    
    
    
required init() {
       
   }
}


