//
//  VehicleHealthDataModel.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 03/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class VehicleHealthDataModel: HandyJSON {
    
    var VehicleHealthDetails: [Any]?
    var HealthyVehiclesCount: Int?
    var  UnHealthyVehiclesCount: Int?
    var  DTCCountModels: Any?
    var TenantId: Int?
    var VehicleId: Int?
    var FleetId: Int?
    var Date: String?
    var TimezoneDate: String?
    
    
    
    
    required init() {
        
    }
}
