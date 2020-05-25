//
//  FleetListServiceAPI.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 15/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
class FleetListServiceAPI: ServiceAPI {
    
    static let shared = FleetListServiceAPI()
    private override init() {}
    
    func getFleetOwnerFleetList(from params: [String:Any], result: @escaping (Result<FleetResponse, APIServiceError>) -> Void) {
        print("###3 in getFleetOwnerFleetList")
        print("###3 params = \(params) ")
        construct(endpoint: .FLEET_OWNER_FLEET_LIST, params: params, method: .POST, result: result)
        
    }
    
    func getTenantVehicleFleetList(from params: [String:Any], result: @escaping (Result<TenantVehicleFleetListResponse, APIServiceError>) -> Void) {
        print("###3 in getTenantVehicleFleetList")
        print("###3 params = \(params) ")
        construct(endpoint: .GET_TENANT_VEHICLE_FLEET_LIST, params: params, method: .POST, result: result)
        
    }
    
    
    func getVehicleListOfFleet(from params: [String:Any], result: @escaping (Result<VehicleListOfFleetResponse, APIServiceError>) -> Void) {
        print("###3 in getVehicleListOfFleet")
        print("###3 params = \(params) ")
        construct(endpoint: .GET_VEHICLE_LIST_OF_FLEET, params: params, method: .POST, result: result)
        
    }
    
    
    func getFleetVehicle(from params: [String:Any], result: @escaping (Result<FleetVehicleResponse, APIServiceError>) -> Void) {
        print("###3 in getFleetVehicle")
        print("###3 params = \(params) ")
        construct(endpoint: .GET_FLEET_VEHICLE, params: params, method: .POST, result: result)
        
    }
    
    
    func getTenantAdminFleetList(from params: [String:Any], result: @escaping (Result<TenantAdminFleetListResponse, APIServiceError>) -> Void) {
        print("###3 in getTenantAdminFleetList")
        print("###3 params = \(params) ")
        construct(endpoint: .GET_TENANT_ADMIN_FLEET_LIST, params: params, method: .POST, result: result)
        
    }
    
    
}
