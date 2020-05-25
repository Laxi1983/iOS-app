//
//  ReportServiceAPI.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 21/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
class ReportServiceAPI: ServiceAPI {
    
    static let shared = ReportServiceAPI()
    private override init() {}
    
    func getUtilizationReportData(from params: [String:Any], result: @escaping (Result<UtilizationReportDataResponse, APIServiceError>) -> Void) {
        print("###3 in getUtilizationReportData")
        print("###3 params = \(params) ")
        construct(endpoint: .GET_UTILIZATION_REPORT_DATA, params: params, method: .POST, result: result)
        
    }
    
    func getSafetyReportData(from params: [String:Any], result: @escaping (Result<SafetyReportDataResponse, APIServiceError>) -> Void) {
        print("###3 in getSafetyReportData")
        print("###3 params = \(params) ")
        construct(endpoint: .GET_SAFETY_REPORT_DATA, params: params, method: .POST, result: result)
        
    }
    
    
    func getVehicleHealthData(from params: [String:Any], result: @escaping (Result<VehicleHealthDataResponse, APIServiceError>) -> Void) {
        print("###3 in getVehicleHealthData")
        print("###3 params = \(params) ")
        construct(endpoint: .GET_VEHICLE_HEALTH_DATA, params: params, method: .POST, result: result)
        
    }
    
    
    func getPowerBIReportsInfo(from params: [String:Any], result: @escaping (Result<PowerBIReportsInfoResponse, APIServiceError>) -> Void) {
        print("###3 in getPowerBIReportsInfo")
        print("###3 params = \(params) ")
        construct(endpoint: .GET_POWER_BI_REPORTS_INFO, params: params, method: .GET, result: result)
        
    }
    
}
