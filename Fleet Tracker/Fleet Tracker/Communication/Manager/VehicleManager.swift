//
//  VehicleManager.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 16/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
class VehicleManager: NSObject {
    
    public static let shared = VehicleManager()
    private override init() {}
    
    var vehicleDelegate :VehicleDelegate?
    
    func getVehicleListByFilter(from params: [String:Any]) {
        
        VehicleServiceAPI.shared.getVehicleListByFilter(from: params, result: { (result: Result<VehicleListByFilterResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response.toJSON()!)")
                self.vehicleDelegate?.VehicleListResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.vehicleDelegate?.VehicleListResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
    
    
    
    
    func getPendingApprovals(from params: [String:Any]) {
        
        VehicleServiceAPI.shared.getPendingApprovals(from: params, result: { (result: Result<PendingApprovalResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response.toJSON()!)")
                self.vehicleDelegate?.PendingApprovalsResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.vehicleDelegate?.PendingApprovalsResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
    
    
    
    func getBookingStatusCount(from params: [String:Any]) {
        
        VehicleServiceAPI.shared.getBookingStatusCount(from: params, result: { (result: Result<BookingStatusCountResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response.toJSON()!)")
                self.vehicleDelegate?.BookingStatusCountResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.vehicleDelegate?.BookingStatusCountResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
    
    
    func getbookingSummary(from params: [String:Any]) {
        
        VehicleServiceAPI.shared.getbookingSummary(from: params, result: { (result: Result<BookingSummaryResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response.toJSON()!)")
                self.vehicleDelegate?.bookingSummaryResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.vehicleDelegate?.bookingSummaryResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
    
    
    func getVehicleDataAssociatedToDriver(from params: [String:Any]) {
        
        VehicleServiceAPI.shared.getVehicleDataAssociatedToDriver(from: params, result: { (result: Result<VehicleDataAssociatedToDriverResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response.toJSON()!)")
                self.vehicleDelegate?.VehicleDataAssociatedToDriverResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.vehicleDelegate?.VehicleDataAssociatedToDriverResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
    
    
    
    func getTodaysBookingStatusCount(from params: [String:Any]) {
        
        VehicleServiceAPI.shared.getTodaysBookingStatusCount(from: params, result: { (result: Result<TodaysBookingStatusCountResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response.toJSON()!)")
                self.vehicleDelegate?.TodaysBookingStatusCountResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.vehicleDelegate?.TodaysBookingStatusCountResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
    
    
    func getBookedVehicleCount(from params: [String:Any]) {
        
        VehicleServiceAPI.shared.getBookedVehicleCount(from: params, result: { (result: Result<BookedVehicleCountResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response.toJSON()!)")
                self.vehicleDelegate?.BookedVehicleCountResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.vehicleDelegate?.BookedVehicleCountResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
    
    
    
    func getSpecificBookingStatus(from params: [String:Any]) {
        
        VehicleServiceAPI.shared.getSpecificBookingStatus(from: params, result: { (result: Result<SpecificBookingStatusResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response.toJSON()!)")
                self.vehicleDelegate?.SpecificBookingStatusResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.vehicleDelegate?.SpecificBookingStatusResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
    
    
    func getVehicleBookingSummary(from params: [String:Any]) {
        
        VehicleServiceAPI.shared.getVehicleBookingSummary(from: params, result: { (result: Result<VehicleBookingSummaryResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response.toJSON()!)")
                self.vehicleDelegate?.VehicleBookingSummaryResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.vehicleDelegate?.VehicleBookingSummaryResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
}
