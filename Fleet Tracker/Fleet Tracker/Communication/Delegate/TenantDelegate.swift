//
//  TenantDelegate.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 21/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
protocol TenantDelegate {
    
    func TenantListResponse(isSuccess: Bool, error: String?, data :TenantListResponse?)
}
