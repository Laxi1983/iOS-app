//
//  BookingSummaryModel.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 20/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class BookingSummaryModel: HandyJSON {
    var VehicleId:String?
    var DeviceSerialNumber:String?
    var DriverName:String?
    var Occupancy:String?
    var VehicleCount:Int?
    var FilteredCount:Int?
    
    required init() {
        
    }
}
