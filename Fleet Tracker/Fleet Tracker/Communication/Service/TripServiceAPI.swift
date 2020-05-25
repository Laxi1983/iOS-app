//
//  TripServiceAPI.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 22/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
class TripServiceAPI: ServiceAPI {
    
    static let shared = TripServiceAPI()
    private override init() {}
    
    func getTripListByFilter(from params: [String:Any], result: @escaping (Result<TripListByFilterResponse, APIServiceError>) -> Void) {
        print("###3 in getTripListByFilter")
        construct(endpoint: .GET_TRIP_LIST_BY_FILTER, params: params, method: .POST, result: result)
    }
    
}
