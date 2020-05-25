//
//  ReportDelegate.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 21/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
protocol ReportDelegate {
    func UtilizationReportDataResponse(isSuccess: Bool, error: String?, data :UtilizationReportDataResponse?)
    
    func SafetyReportDataResponse(isSuccess: Bool, error: String?, data :SafetyReportDataResponse?)
    
    func VehicleHealthDataResponse(isSuccess: Bool, error: String?, data :VehicleHealthDataResponse?)
    
    func PowerBIReportsInfoResponse(isSuccess: Bool, error: String?, data :PowerBIReportsInfoResponse?)
}
