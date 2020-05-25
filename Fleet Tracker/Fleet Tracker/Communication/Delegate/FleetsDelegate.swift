//
//  FleetsDelegate.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 15/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
protocol FleetsDelegate {
    func FleetOwnerFleetListResponse(isSuccess: Bool, error: String?, data :FleetResponse?)
    
    
    
    func TenantVehicleFleetListResponse(isSuccess: Bool, error: String?, data :TenantVehicleFleetListResponse?)
    
    
    func VehicleListOfFleet(isSuccess: Bool, error: String?, data :VehicleListOfFleetResponse?)
    
    
    func FleetVehicleResponse(isSuccess: Bool, error: String?, data :FleetVehicleResponse?)
    
    
    func TenantAdminFleetListResponse(isSuccess: Bool, error: String?, data :TenantAdminFleetListResponse?)
    
    
}
