//
//  GeofenceDelegate.swift
//  Fleet Tracker
//
//  Created by Ritesh Gupta on 20/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
protocol GeofenceDelegate {
    
    func getAlertsResponse(isSuccess: Bool, error: String?, data :AlertsResponse?)
   
}
