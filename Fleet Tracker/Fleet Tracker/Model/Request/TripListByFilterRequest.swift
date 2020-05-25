//
//  TripListByFilterRequest.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 22/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class TripListByFilterRequest: HandyJSON
{
    var TenantId: Int?
    var VehicleId: Int?
    var RecordStartDateStr: String?
    var RecordEndDateStr: String?
    
    
    
    required init() {
        
    }
    
    init(TenantId:Int, VehicleId: Int, RecordStartDateStr: String, RecordEndDateStr: String)
    {
        self.TenantId = TenantId
        self.VehicleId = VehicleId
        self.RecordStartDateStr = RecordStartDateStr
        self.RecordEndDateStr = RecordEndDateStr
        
    }
}
