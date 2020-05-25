//
//  TripDelegate.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 22/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
protocol TripDelegate {
    
    func tripListByFilterResponse(isSuccess: Bool, error: String?, data :TripListByFilterResponse?)
}
