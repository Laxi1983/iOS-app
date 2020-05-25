//
//  SpecificBookingStatusRequest.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 03/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class SpecificBookingStatusRequest: HandyJSON
{
    var EndDate: String?
    var StartDate: String?
    var fleetId: Int?
    var TenantId: Int?
    var vehicleId: Int?
    
    required init() {
        
    }
    
    init( EndDate: String, StartDate: String, fleetId: Int, TenantId:Int, vehicleId: Int )
    {
        self.EndDate = EndDate
        self.StartDate = StartDate
        self.fleetId = fleetId
        self.TenantId = TenantId
        self.vehicleId = vehicleId
        
    }
    
}
