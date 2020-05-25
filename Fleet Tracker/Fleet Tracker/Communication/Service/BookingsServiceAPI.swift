//
//  BookingsServiceAPI.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 17/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
class BookingsServiceAPI: ServiceAPI {
    
    static let shared = BookingsServiceAPI()
    private override init() {}
    
    func getLoggedInUserBookings(from params: [String:Any], result: @escaping (Result<LoggedInUserBookingsResponse, APIServiceError>) -> Void) {
        print("###3 in getLoggedInUserBookings")
        print("###3 params = \(params) ")
        construct(endpoint: .GET_LOGGEDIN_USER_BOOKINGS, params: params, method: .POST, result: result)
        
    }
    
}
