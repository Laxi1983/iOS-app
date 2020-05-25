//
//  VehicleDelegate.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 16/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
protocol VehicleDelegate {
    func VehicleListResponse(isSuccess: Bool, error: String?, data :VehicleListByFilterResponse?)
    
    func PendingApprovalsResponse(isSuccess: Bool, error: String?, data :PendingApprovalResponse?)
    
    
    func BookingStatusCountResponse(isSuccess: Bool, error: String?, data :BookingStatusCountResponse?)
    
    func bookingSummaryResponse(isSuccess: Bool, error: String?, data :BookingSummaryResponse?)
    
    func VehicleDataAssociatedToDriverResponse(isSuccess: Bool, error: String?, data :VehicleDataAssociatedToDriverResponse?)
    
    func TodaysBookingStatusCountResponse(isSuccess: Bool, error: String?, data :TodaysBookingStatusCountResponse?)
    
    func BookedVehicleCountResponse(isSuccess: Bool, error: String?, data :BookedVehicleCountResponse?)
    
    
    func SpecificBookingStatusResponse(isSuccess: Bool, error: String?, data :SpecificBookingStatusResponse?)
    
    func VehicleBookingSummaryResponse(isSuccess: Bool, error: String?, data :VehicleBookingSummaryResponse?)
    
}
