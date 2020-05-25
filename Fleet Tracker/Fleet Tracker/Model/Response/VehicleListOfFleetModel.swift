//
//  VehicleListOfFleetModel.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 20/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class VehicleListOfFleetModel: HandyJSON {
    var VehicleId:Int?
    var VehicleName:String?
    var Make:String?
    var Model:String?
    var VIN:String?
    var RegistrationNumber:String?
    var DeviceSerialNumber:String?
    var DriverName:String?
    var DriverUserId:Int?
    var FleetId:Int?
    var FleetUnitId:Int?
    var Metric:Int?
    var ParametersData:String?
    var LastConnectedTimeEpoch:Int?
    var LastConnectedLocalDateTime:String?
    var ModelYear:Int?
    var ManufacturedIn:String?
    var Odometer:Int?
    var FleetName:String?
    var PassengersCount:Int?
    var VehicleCount:Int?
    var FilteredCount:Int?
    
    
    required init() {
        
    }
}

