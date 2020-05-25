//
//  UserBookingsManager.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 17/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
class UserBookingsManager: NSObject {
    
    public static let shared = UserBookingsManager()
    private override init() {}
    
    var userBookingsDelegate :UserBookingsDelegate?
    
    func getLoggedInUserBookings(from params: [String:Any]) {
        
        BookingsServiceAPI.shared.getLoggedInUserBookings(from: params, result: { (result: Result<LoggedInUserBookingsResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response.toJSON()!)")
                self.userBookingsDelegate?.UserBookingsResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.userBookingsDelegate?.UserBookingsResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
}
