//
//  SafetyReportDataRequest.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 21/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation

import HandyJSON
class SafetyReportDataRequest: HandyJSON
{
    var TenantId: Int?
    var FleetId: Int?
    var VehicleId: Int?
    var RecordStartDateStr: String?
    var RecordEndDateStr: String?
    var MaxSpeedLimit: Int?
    
    
    required init() {
        
    }
    
    init(TenantId:Int, FleetId:Int, VehicleId: Int, RecordStartDateStr: String, RecordEndDateStr: String, MaxSpeedLimit: Int)
    {
        self.TenantId = TenantId
        self.FleetId = FleetId
        self.VehicleId = VehicleId
        self.RecordStartDateStr = RecordStartDateStr
        self.RecordEndDateStr = RecordEndDateStr
        self.MaxSpeedLimit = MaxSpeedLimit
        
    }
}
