//
//  UserBookingsDelegate.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 17/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
protocol UserBookingsDelegate {
    func UserBookingsResponse(isSuccess: Bool, error: String?, data :LoggedInUserBookingsResponse?)
}
