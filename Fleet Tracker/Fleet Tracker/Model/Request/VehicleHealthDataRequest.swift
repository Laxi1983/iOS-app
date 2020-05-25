//
//  VehicleHealthDataRequest.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 03/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class VehicleHealthDataRequest: HandyJSON
{
    var FleetId: Int?
    var RecordEndDateStr: String?
    var RecordStartDateStr: String?
    var TenantId: Int?
    
    required init() {
        
    }
    
    init( FleetId: Int, RecordEndDateStr: String, RecordStartDateStr: String, TenantId:Int  )
    {
        self.FleetId = FleetId
        self.RecordEndDateStr = RecordEndDateStr
        self.RecordStartDateStr = RecordStartDateStr
        self.TenantId = TenantId
        
        
    }
    
}
