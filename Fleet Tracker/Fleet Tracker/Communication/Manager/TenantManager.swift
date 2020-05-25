//
//  TenantManager.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 21/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
class TenantManager: NSObject {
    
    public static let shared = TenantManager()
    private override init() {}
    
    var tenantDelegate :TenantDelegate?
    
    func getTenantList(from params: [String:Any]) {
        
        TenantServiceAPI.shared.getTenantList(from: params, result: { (result: Result<TenantListResponse, APIServiceError>) in
            switch result {
            case .success(let response):
                // Determine success or error
                print("###6 in success")
                print("###6 in success Data = \(response.toJSON()!)")
                self.tenantDelegate?.TenantListResponse(isSuccess: true, error: nil, data: response)
            case .failure(let error):
                print("###6 in failure")
                self.tenantDelegate?.TenantListResponse(isSuccess: false, error: error.localizedDescription, data: nil)
            }
        })
    }
}
