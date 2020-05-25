//
//  UserServiceAPI.swift
//  Fleet Tracker
//
//  Created by Sandip Mahajan on 05/12/19.
//  Copyright © 2019 Mobiliya. All rights reserved.
//

import UIKit

class UserServiceAPI: ServiceAPI {
    
    static let shared = UserServiceAPI()
    private override init() {}
    
    func login(from params: [String:Any], result: @escaping (Result<UserResponse, APIServiceError>) -> Void) {        
        construct(endpoint: .LOGIN, params: params, method: .POST, result: result)
    }
    
    func getRoleBasedUserCount(from params: [String:Any], result: @escaping (Result<RoleBasedUserCountResponse, APIServiceError>) -> Void) {
        construct(endpoint: .GET_ROLE_BASED_USER_COUNT, params: params, method: .POST, result: result)
    }
    
    func getUsers(from params: [String:Any], result: @escaping (Result<GetUserResponse, APIServiceError>) -> Void) {
        construct(endpoint: .GET_USERS, params: params, method: .POST, result: result)
    }
    
}
