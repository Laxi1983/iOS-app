//
//  DashboardManager.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 21/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
class DashboardManager: NSObject {
    
    public static let shared = DashboardManager()
    private override init() {}
    
    var dashboardDelegate :DashboardDelegate?
    
    func getSADashboardSummary(from params: [String:Any]) {
        
        DashboardServiceAPI.shared.getSADashboardSummary(from: params, result: { (result: Result<SADashboardSummaryResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response.toJSON()!)")
                self.dashboardDelegate?.SADashboardSummaryResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.dashboardDelegate?.SADashboardSummaryResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
}
