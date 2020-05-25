//
//  RouteServiceAPI.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 22/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
class RouteServiceAPI: ServiceAPI {
    
    static let shared = RouteServiceAPI()
    private override init() {}
    
    func getRouteList(from params: [String:Any], result: @escaping (Result<RouteListResponse, APIServiceError>) -> Void) {
        print("###3 in getRouteList")
        construct(endpoint: .GET_ROUTE_LIST, params: params, method: .POST, result: result)
    }
    
    func deleteRoute(from params: [String:Any], result: @escaping (Result<DeleteRouteResponse, APIServiceError>) -> Void) {
        print("###3 in deleteRoute")
        construct(endpoint: .DELETE_ROUTE, params: params, method: .POST, result: result)
    }
    
}
