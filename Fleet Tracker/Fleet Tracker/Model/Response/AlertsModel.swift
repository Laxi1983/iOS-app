//
//  AlertsModel.swift
//  Fleet Tracker
//
//  Created by Ritesh Gupta on 22/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class AlertsModel: HandyJSON {

var alertId:Int?
var geofenceName:String?
var vehicleName:String?
var severity:Int?
var type:Int?
var description:String?
var updatedAt:String?
var date:String?
var alertEpochTime:Int?
    
    
    
required init() {
       
   }
}
