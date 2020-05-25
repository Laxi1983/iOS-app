//
//  FleetModel.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 16/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class FleetModel:HandyJSON  {
    
    var FleetId:Int?
    var FleetName:String?
    var Description:String?
    var UpdatedDateTime:String?
    var UpdatedBy:Int?
    var FleetTimeZoneId:String?
    var Metric:Int?
    var FleetTimeZoneInfo:TimeZoneInfo?

    required init() {
        
    }
    
    

}

class TimeZoneInfo:HandyJSON
{
    var Id:String?
    var DisplayName:String?
    var BaseUtcOffset:Int32?
    
    required init() {
        
    }
}
