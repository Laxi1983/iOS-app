//
//  FleetsManager.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 15/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
class FleetsManager: NSObject {
    
    public static let shared = FleetsManager()
    private override init() {}
    
    var fleetsDelegate :FleetsDelegate?
    
    func FleetOwnerFleetList(from params: [String:Any]) {
        FleetListServiceAPI.shared.getFleetOwnerFleetList(from: params, result: { (result: Result<FleetResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response)")
                print("###6 in success Data = \(response.toJSON()!)")
                
                self.fleetsDelegate?.FleetOwnerFleetListResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.fleetsDelegate?.FleetOwnerFleetListResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
    
    
    func TenantVehicleFleetList(from params: [String:Any]) {
        FleetListServiceAPI.shared.getTenantVehicleFleetList(from: params, result: { (result: Result<TenantVehicleFleetListResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response)")
                print("###6 in success Data = \(response.toJSON()!)")
                
                self.fleetsDelegate?.TenantVehicleFleetListResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.fleetsDelegate?.TenantVehicleFleetListResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
    
    
    
    func VehicleListOfFleet(from params: [String:Any]) {
        FleetListServiceAPI.shared.getVehicleListOfFleet(from: params, result: { (result: Result<VehicleListOfFleetResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response)")
                print("###6 in success Data = \(response.toJSON()!)")
                
                self.fleetsDelegate?.VehicleListOfFleet(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.fleetsDelegate?.VehicleListOfFleet(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
    
    
    
    func FleetVehicle(from params: [String:Any]) {
        FleetListServiceAPI.shared.getFleetVehicle(from: params, result: { (result: Result<FleetVehicleResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response)")
                print("###6 in success Data = \(response.toJSON()!)")
                
                self.fleetsDelegate?.FleetVehicleResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.fleetsDelegate?.FleetVehicleResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
    
    
    
    
    
    func TenantAdminFleetList(from params: [String:Any]) {
        FleetListServiceAPI.shared.getTenantAdminFleetList(from: params, result: { (result: Result<TenantAdminFleetListResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response)")
                print("###6 in success Data = \(response.toJSON()!)")
                
                self.fleetsDelegate?.TenantAdminFleetListResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.fleetsDelegate?.TenantAdminFleetListResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
    
    
    
}
