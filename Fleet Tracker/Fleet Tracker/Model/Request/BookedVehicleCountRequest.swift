//
//  BookedVehicleCountRequest.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 03/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class BookedVehicleCountRequest: HandyJSON
{
    var tenantId: Int?
    
    
    required init() {
        
    }
    
    init( tenantId: Int  )
    {
        self.tenantId = tenantId
        
        
    }
    
}
