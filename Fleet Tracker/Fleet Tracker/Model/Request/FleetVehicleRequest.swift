//
//  FleetVehicleRequest.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 21/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class FleetVehicleRequest: HandyJSON
{
    var tenantId:Int?
    var fleetId:Int?
    required init() {
        
    }
    
    init(tenantId:Int, fleetId:Int)
    {
        self.tenantId = tenantId
        self.fleetId = fleetId
    }
    
}
