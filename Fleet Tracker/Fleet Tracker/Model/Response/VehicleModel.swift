//
//  VehicleModel.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 16/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON


class VehicleModel: HandyJSON {
    var FleetId:Int?
    var FleetName:String?
    var TotalVehiclesCount:Int?
    var FaultyVehiclesCount:Int?
    var RunningVehiclesCount:Int?
    var VehicleInfo:[VehicleData]?
    
    required init() {
        
    }
    
    init(FleetId:Int, FleetName:String, TotalVehiclesCount:Int, FaultyVehiclesCount:Int, RunningVehiclesCount:Int, VehicleInfo:[VehicleData]){
        self.FleetId = FleetId
        self.FleetName = FleetName
        self.TotalVehiclesCount = TotalVehiclesCount
        self.FaultyVehiclesCount = FaultyVehiclesCount
        self.RunningVehiclesCount = RunningVehiclesCount
        self.VehicleInfo = VehicleInfo
        
        
    }
    
}


class VehicleData:HandyJSON
{
    var VehicleId:String?
    var VehicleName:String?
    var IsFaultPresent:String?
    var Latitude:String?
    var Longitude:String?
    var Direction:String?
    var Odometer:String?
    var VehicleState:String?
    var LastConnectedTimeEpoch:String?
    var LastConnectedLocalDateTime:String?
    
    
    
    required init() {
        
    }
}
