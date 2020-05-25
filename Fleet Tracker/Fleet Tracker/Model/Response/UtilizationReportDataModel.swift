//
//  UtilizationReportDataModel.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 21/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class UtilizationReportDataModel: HandyJSON {
    var VehicleId:Int?
    var VehicleName:String?
    var RunHours:Int?
    var DistanceTravelled:Int?
    var TenantId:Int?
    var FleetId:Int?
    var Date:String?
    var TimezoneDate:String?

required init() {
       
   }
}
