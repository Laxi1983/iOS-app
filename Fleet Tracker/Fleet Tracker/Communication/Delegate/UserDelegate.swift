//
//  UserDelegate.swift
//  Fleet Tracker
//
//  Created by Sandip Mahajan on 05/12/19.
//  Copyright © 2019 Mobiliya. All rights reserved.
//

import UIKit

protocol UserDelegate {
    func loginResponse(isSuccess: Bool, error: String?, data : UserResponse?)
    
    func RoleBasedUserCountResponse(isSuccess: Bool, error: String?, data : RoleBasedUserCountResponse?)
    
    func usersResponse(isSuccess: Bool, error: String?, data : GetUserResponse?)
}

protocol MSALUserDelegate {
    func response(isSuccess: Bool, error: String, data : MSALUserModel?)
}
