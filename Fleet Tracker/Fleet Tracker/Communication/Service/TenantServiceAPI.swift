//
//  TenantServiceAPI.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 21/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
class TenantServiceAPI: ServiceAPI {
    
    static let shared = TenantServiceAPI()
    private override init() {}
    
    func getTenantList(from params: [String:Any], result: @escaping (Result<TenantListResponse, APIServiceError>) -> Void) {
        print("###3 in getTenantList")
        construct(endpoint: .GET_TENANT_LIST, params: params, method: .GET, result: result)
    }
    
}
