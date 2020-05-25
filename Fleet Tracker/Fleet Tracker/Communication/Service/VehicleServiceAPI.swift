//
//  VehicleServiceAPI.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 16/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
class VehicleServiceAPI: ServiceAPI {
    
    static let shared = VehicleServiceAPI()
    private override init() {}
    
    func getVehicleListByFilter(from params: [String:Any], result: @escaping (Result<VehicleListByFilterResponse, APIServiceError>) -> Void) {
        print("###3 in getVehicleListByFilter")
        print("###3 params = \(params) ")
        construct(endpoint: .GET_VEHICLE_LIST_BY_FILTER, params: params, method: .POST, result: result)
        
    }
    
    
    func getPendingApprovals(from params: [String:Any], result: @escaping (Result<PendingApprovalResponse, APIServiceError>) -> Void) {
        print("###3 in getPendingApprovals")
        print("###3 params = \(params) ")
        construct(endpoint: .GET_PENDING_APPROVALS, params: params, method: .POST, result: result)
        
    }
    
    
    func getBookingStatusCount(from params: [String:Any], result: @escaping (Result<BookingStatusCountResponse, APIServiceError>) -> Void) {
        print("###3 in getBookingStatusCount")
        print("###3 params = \(params) ")
        construct(endpoint: .GET_BOOKING_STATUS_COUNT, params: params, method: .POST, result: result)
        
    }
    
    
    func getbookingSummary(from params: [String:Any], result: @escaping (Result<BookingSummaryResponse, APIServiceError>) -> Void) {
        print("###3 in getbookingSummary")
        print("###3 params = \(params) ")
        construct(endpoint: .GET_BOOKING_SUMMARY, params: params, method: .POST, result: result)
        
    }
    
    
    func getVehicleDataAssociatedToDriver(from params: [String:Any], result: @escaping (Result<VehicleDataAssociatedToDriverResponse, APIServiceError>) -> Void) {
        print("###3 in getVehicleDataAssociatedToDriver")
        print("###3 params = \(params) ")
        construct(endpoint: .GET_VEHICLE_DATA_ASSOCIATED_TO_DRIVER, params: params, method: .GET, result: result)
        
    }
    
    
    
    func getTodaysBookingStatusCount(from params: [String:Any], result: @escaping (Result<TodaysBookingStatusCountResponse, APIServiceError>) -> Void) {
        print("###3 in getTodaysBookingStatusCount")
        print("###3 params = \(params) ")
        construct(endpoint: .GET_TODAYS_BOOKING_STATUS_COUNT, params: params, method: .POST, result: result)
        
    }
    
    
    func getBookedVehicleCount(from params: [String:Any], result: @escaping (Result<BookedVehicleCountResponse, APIServiceError>) -> Void) {
        print("###3 in getBookedVehicleCount")
        print("###3 params = \(params) ")
        construct(endpoint: .GET_BOOKED_VEHICLE_COUNT, params: params, method: .POST, result: result)
        
    }
    
    
    func getSpecificBookingStatus(from params: [String:Any], result: @escaping (Result<SpecificBookingStatusResponse, APIServiceError>) -> Void) {
        print("###3 in getSpecificBookingStatus")
        print("###3 params = \(params) ")
        construct(endpoint: .GET_SPECIFIC_BOOKING_STATUS, params: params, method: .POST, result: result)
        
    }
    
    
    func getVehicleBookingSummary(from params: [String:Any], result: @escaping (Result<VehicleBookingSummaryResponse, APIServiceError>) -> Void) {
        print("###3 in getVehicleBookingSummary")
        print("###3 params = \(params) ")
        construct(endpoint: .GET_VEHICLE_BOOKING_SUMMARY, params: params, method: .POST, result: result)
        
    }
    
}
