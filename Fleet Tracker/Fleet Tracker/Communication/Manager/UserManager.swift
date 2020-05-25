//
//  UserManager.swift
//  Fleet Tracker
//
//  Created by Sandip Mahajan on 05/12/19.
//  Copyright © 2019 Mobiliya. All rights reserved.
//

import UIKit

public enum UserRole : Int {
    case SUPER_ADMIN = 1
    case TENANT_ADMIN = 3
    case FLEET_OWNER = 4
    case DRIVER = 5
    case PASSENGER = 6
}

class UserManager: NSObject {
    
    public static let shared = UserManager()
    var user:UserModel?
    private override init() {}
    
    var userDelegate : UserDelegate?
    
    
    func login(from params: [String:Any]) {
        
        UserServiceAPI.shared.login(from: params, result: { (result: Result<UserResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                self.userDelegate?.loginResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                self.userDelegate?.loginResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
    
    
    func getRoleBasedUserCount(from params: [String:Any]) {
        
        UserServiceAPI.shared.getRoleBasedUserCount(from: params, result: { (result: Result<RoleBasedUserCountResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                self.userDelegate?.RoleBasedUserCountResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                self.userDelegate?.RoleBasedUserCountResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
    
    
    
    func getUsers(from params: [String:Any]) {
        
        UserServiceAPI.shared.getUsers(from: params, result: { (result: Result<GetUserResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                self.userDelegate?.usersResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                self.userDelegate?.usersResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
}
