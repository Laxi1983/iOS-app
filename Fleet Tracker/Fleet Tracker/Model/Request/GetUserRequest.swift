//
//  UserRequest.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 01/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class GetUserRequest: HandyJSON
{
    var Role: Int?
    var isSearchTextLengthValid: Bool?
    var pageNo: Int?
    var pageSize: Int?
    var searchKey:String?
    var sortColumnName: String?
    var sortType: String?
    var startRecordNo: Int?
    var tenantId: Int?
    
    required init() {
        
    }
    
    init(Role: Int, isSearchTextLengthValid: Bool, pageNo: Int, pageSize: Int, searchKey:String, sortColumnName: String, sortType: String, startRecordNo: Int, tenantId: Int  )
    {
        self.Role = Role
        self.isSearchTextLengthValid = isSearchTextLengthValid
        self.pageNo = pageNo
        self.pageSize = pageSize
        self.searchKey = searchKey
        self.sortColumnName = sortColumnName
        self.sortType = sortType
        self.startRecordNo = startRecordNo
        self.tenantId = tenantId
        
    }
    
}
