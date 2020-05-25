//
//  SafetyReportDataModel.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 21/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class SafetyReportDataModel: HandyJSON {
//    var SafetyReportSpeedInfo:[]?
//    var SafetyReportSpeedRangeInfo:[]?
//    var SafetyReportOverSpeedInfo:[]?
    var TenantId:Int?
    var VehicleId:Int?
    var FleetId:Int?
    var Date:String?
    var TimezoneDate:String?

required init() {
       
   }
}
