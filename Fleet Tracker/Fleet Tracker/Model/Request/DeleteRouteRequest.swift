//
//  DeleteRouteRequest.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 22/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class DeleteRouteRequest: HandyJSON
{
    var routeId:Int?
    var tenantId:Int?
    required init() {
        
    }
    
    init(routeId:Int, tenantId:Int)
    {
        self.routeId = routeId
        self.tenantId = tenantId
    }
    
}
