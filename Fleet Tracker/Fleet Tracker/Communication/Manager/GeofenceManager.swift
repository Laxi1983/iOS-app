//
//  GeofenceManager.swift
//  Fleet Tracker
//
//  Created by Ritesh Gupta on 20/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
class GeofenceManager: NSObject {
    
    public static let shared = GeofenceManager()
    private override init() {}
    
    var geofenceDelegate :GeofenceDelegate?
    
    func getAlerts(from params: [String:Any]) {
        
//        GeofenceServiceAPI.shared.getAlerts(from: params, result: { (result: Result<TripListByFilterResponse, APIServiceError>) in
//            switch result {
//            case .success(let response):
//                // Determine success or error
//                print("###6 in success")
//                print("###6 in success Data = \(response.toJSON()!)")
//                self.geofenceDelegate?.AlertsResponse(isSuccess: true, error: nil, data: response)
//            case .failure(let error):
//                print("###6 in failure")
//                self.geofenceDelegate?.AlertsResponse(isSuccess: false, error: error.localizedDescription, data: nil)
//            }
//        })
   }
}
