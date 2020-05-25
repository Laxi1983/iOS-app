//
//  DashboardServiceAPI.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 21/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
class DashboardServiceAPI: ServiceAPI {
    
    static let shared = DashboardServiceAPI()
    private override init() {}
    
    func getSADashboardSummary(from params: [String:Any], result: @escaping (Result<SADashboardSummaryResponse, APIServiceError>) -> Void) {
        print("###3 in getSADashboardSummary")
        construct(endpoint: .GET_SA_DASHBOARD_SUMMARY, params: params, method: .GET, result: result)
    }
    
}
