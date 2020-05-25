//
//  TenantListModel.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 21/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class TenantListModel: HandyJSON {
    var Id: Int?
    var CompanyName: String?
    var Description: String?
    var Status: Int?
    var User: String?
    var DefaultSettings: String?
    var Settings: String?
    var TenantCode: String?
    var TenantType: Int?
    var TenantCount: Int?
    var FilteredCount: Int?
    var CountryId: Int?
    var CountryCode: String?
    var CountryLatitude: Double?
    var CountryLongitude: Double?
    
    required init() {
        
    }
}
