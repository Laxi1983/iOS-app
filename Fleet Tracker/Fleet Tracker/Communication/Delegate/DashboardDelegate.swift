//
//  DashboardDelegate.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 21/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
protocol DashboardDelegate {
    
    func SADashboardSummaryResponse(isSuccess: Bool, error: String?, data :SADashboardSummaryResponse?)
}
