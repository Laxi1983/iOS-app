//
//  BookingStatusCountRequest.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 20/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class BookingStatusCountRequest: HandyJSON
{
    var tenantId:Int?
    var fleetId:Int?
    required init() {
        
    }
    
    init(tenantId:Int, fleetId:Int)
    {
        self.tenantId = tenantId
        self.fleetId = fleetId
    }
    
}
