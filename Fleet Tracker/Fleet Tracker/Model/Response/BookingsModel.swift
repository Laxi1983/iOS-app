//
//  BookingsModel.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 17/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON


class BookingsModel: HandyJSON {
    var BookingId:Int?
    var RecordId:String?
    var VehicleId:Int?
    var VehicleName:String?
    var FleetId:Int?
    var FleetName:String?
    var BookingType:Int?
    var ApprovalStatus:Int?
    var UserId:Int?
    var RouteId:Int?
    var UserName:String?
    var UserEmail:String?
    var StartTime:String?
    var EndTime:String?
    var StartDateTimeEpoch:Int?
    var EndDateTimeEpoch:Int?
    var StartDateLocaleString:String?
    var EndDateLocaleString:String?
    var StartLocation:String?
    var EndLocation:String?
    var FleetTimeZoneId:String?
    var TripLocations:String?
    var TripLocationsArr:[TripLocations]?
    var UserComments:String?
    var ApproverComments:String?
    var NoOfPassengers:Int?
    var TripCategory:Int?
    var TripType:Int?
    var Luggage:Int?
    var ReturnTimeStamp:String?
    var ReturnTimeEpoch:Int?
    var ReturnTimeLocaleString:String?
    var ApprovalTimeStamp:String?
    var ApprovalTimeStampEpoch:Int?
    var ApprovalTimeLocaleString:String?
    var BookingCount:Int?
    var FilteredCount:Int?
    var AuthFileDownloadUrl:String?
    var AuthorizationLetterFile:String?
    var TripStatus:Int?
    var FleetTimeZoneInfo:String?
    var BookingVehicleInfo:BookingVehicle?
    
   required init() {
       
   }

}

class TripLocations:HandyJSON
{
    var index:Int?
    var name:String?
    var formattedAddress:String?
    var lat:Int32?
    var lng:Int32?
    
    required init() {
        
    }
}

class BookingVehicle:HandyJSON
{
     var VehicleId:Int?
     var VehicleName:String?
     var Make:String?
     var Model:String?
     var ModelYear:String?
     var ManufacturedIn:String?
     var RegistrationNumber:String?
     var DriverUserId:Int?
     var DriverName:String?
     var DriverEmail:String?
    
    
    required init() {
        
    }
    
}
