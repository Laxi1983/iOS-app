//
//  FleetOwnerFleetListRequest.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 15/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class FleetOwnerFleetListRequest: HandyJSON
{
    var tenantId:Int?
    required init() {
        
    }
    
    init(tenantId:Int)
    {
        self.tenantId = tenantId
    }
    
}
