//
//  RouteManager.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 22/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
class RouteManager: NSObject {
    
    public static let shared = RouteManager()
    private override init() {}
    
    var routeDelegate :RouteDelegate?
    
    func getRouteList(from params: [String:Any]) {
        
        RouteServiceAPI.shared.getRouteList(from: params, result: { (result: Result<RouteListResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response.toJSON()!)")
                self.routeDelegate?.RouteListResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.routeDelegate?.RouteListResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
    
    func deleteRoute(from params: [String:Any]) {
        
        RouteServiceAPI.shared.deleteRoute(from: params, result: { (result: Result<DeleteRouteResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response.toJSON()!)")
                self.routeDelegate?.DeleteRouteResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.routeDelegate?.DeleteRouteResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
}
