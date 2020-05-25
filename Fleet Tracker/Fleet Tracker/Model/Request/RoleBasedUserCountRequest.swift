//
//  RoleBasedUserCountRequest.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 21/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class RoleBasedUserCountRequest: HandyJSON
{
    var tenantId:Int?
    
    required init() {
        
    }
    
    init(tenantId:Int)
    {
        self.tenantId = tenantId
    }
}
