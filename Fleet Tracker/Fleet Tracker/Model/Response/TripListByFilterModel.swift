//
//  TripListByFilterModel.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 22/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class TripListByFilterModel: HandyJSON {
    var TripName: String?
    var StartTimeEpoch: Int32?
    var StartLocalTime: String?
    var EndTimeEpoch: Int32?
    var EndLocalTime: String?
    var FaultCount: Int?
    var TripDistance: Double?
    var TripStatus: Int?
    var FuelDifference: Int?
    var TripLocations: [TripLocationModel]?
    var VehicleName: String?
    var TenantId: Int?
    var VehicleId: Int?
    var FleetId: Int?
    var Date: String?
    var TimezoneDate: String?
    var Device_WakeUp_or_PowerUp: Int?
    var Ignition_OFF_1Hr: Int?
    var COMM_Connected: Int?
    var GPS_Quality_Fix_Acquired: Int?
    var Ignition_OFF_10s: Int?
    var Ignition_OFF: Int?
    var Ignition_ON: Int?
    var Harsh_Acceleration: Int?
    var Harsh_Braking: Int?
    var Harsh_Left: Int?
    var Harsh_Right: Int?
    var Ignition_OFF_1day: Int?
    var Device_on_Internal_BackUp_Battery: Int?
    var Device_on_External_Battery: Int?
    var Possible_Accident: Int?
    var Tow_Event_Detected: Int?
    var  Ignition_ON_180s: Int?
    var Ignition_ON_1500_meters_travelled: Int?
    var Ignition_ON_Heading_change_of_more_than_5_degrees: Int?
    var Geofence_IN: Int?
    var Geofence_OUT: Int?
    var DTC_Faults: Int?
    
    required init() {
        
    }
}


class TripLocationModel:HandyJSON
{
    
    var Latitude: Double?
    var Longitude: Double?
    var Speed: Double?
    var RecordTimeEpoch: Int32?
    var RecordLocalDateTime: String?
    var DistanceFromPrevPoint: Int?
    
    required init() {
        
    }
    
}
