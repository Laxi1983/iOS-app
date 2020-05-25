//
//  RouteDelegate.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 22/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
protocol RouteDelegate {
    
    func RouteListResponse(isSuccess: Bool, error: String?, data :RouteListResponse?)
    func DeleteRouteResponse(isSuccess: Bool, error: String?, data :DeleteRouteResponse?)
}
