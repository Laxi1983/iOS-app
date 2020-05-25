//
//  ReportManager.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 21/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
class ReportManager: NSObject {
    
    public static let shared = ReportManager()
    private override init() {}
    
    var reportDelegate :ReportDelegate?
    
    func getUtilizationReportData(from params: [String:Any]) {
        
        ReportServiceAPI.shared.getUtilizationReportData(from: params, result: { (result: Result<UtilizationReportDataResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response.toJSON()!)")
                self.reportDelegate?.UtilizationReportDataResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.reportDelegate?.UtilizationReportDataResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
    
    func getSafetyReportData(from params: [String:Any]) {
        
        ReportServiceAPI.shared.getSafetyReportData(from: params, result: { (result: Result<SafetyReportDataResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response.toJSON()!)")
                self.reportDelegate?.SafetyReportDataResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.reportDelegate?.SafetyReportDataResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
    
    
    
    
    func getVehicleHealthData(from params: [String:Any]) {
        
        ReportServiceAPI.shared.getVehicleHealthData(from: params, result: { (result: Result<VehicleHealthDataResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response.toJSON()!)")
                self.reportDelegate?.VehicleHealthDataResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.reportDelegate?.VehicleHealthDataResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
    
    
    
    
    
    func getPowerBIReportsInfo(from params: [String:Any]) {
        
        ReportServiceAPI.shared.getPowerBIReportsInfo(from: params, result: { (result: Result<PowerBIReportsInfoResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response.toJSON()!)")
                self.reportDelegate?.PowerBIReportsInfoResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.reportDelegate?.PowerBIReportsInfoResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
}
