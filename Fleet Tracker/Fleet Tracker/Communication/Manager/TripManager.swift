//
//  TripManager.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 22/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
class TripManager: NSObject {
    
    public static let shared = TripManager()
    private override init() {}
    
    var tripDelegate :TripDelegate?
    
    func getTripListByFilter(from params: [String:Any]) {
        
        TripServiceAPI.shared.getTripListByFilter(from: params, result: { (result: Result<TripListByFilterResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response.toJSON()!)")
                self.tripDelegate?.tripListByFilterResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.tripDelegate?.tripListByFilterResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
}
