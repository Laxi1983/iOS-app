//
//  VehicleDataAssociatedToDriverModel.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 22/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class VehicleDataAssociatedToDriverModel: HandyJSON {
    var VehicleId: Int?
    var VehicleName: String?
    var IsFaultPresent: Bool?
    var Latitude: Double?
    var Longitude: Double?
    var Direction: Int?
    var Odometer: Int?
    var VehicleState: Int?
    var LastConnectedTimeEpoch: Int32?
    var LastConnectedLocalDateTime: String?
    
    required init() {
        
    }
}
