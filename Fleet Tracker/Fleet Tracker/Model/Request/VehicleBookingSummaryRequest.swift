//
//  VehicleBookingSummaryRequest.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 03/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class VehicleBookingSummaryRequest: HandyJSON
{
    var EndDate: String?
    var StartDate: String?
    var fleetId: Int?
    var isSearchTextLengthValid: Bool?
    var pageNo: Int?
    var pageSize: Int?
    var searchKey: String?
    var sortColumnName: String?
    var sortType: String?
    var startRecordNo: Int?
    var tenantId: Int?
    var vehicleId: Int?
    
    required init() {
        
    }
    
    init( EndDate: String, StartDate: String, fleetId: Int, isSearchTextLengthValid:Bool, pageNo: Int, pageSize: Int, searchKey: String, sortColumnName: String, sortType: String, startRecordNo: Int, tenantId: Int, vehicleId: Int)
    {
        self.EndDate = EndDate
        self.StartDate = StartDate
        self.fleetId = fleetId
        self.isSearchTextLengthValid = isSearchTextLengthValid
        self.pageNo = pageNo
        self.pageSize = pageSize
        self.searchKey = searchKey
        self.sortColumnName = sortColumnName
        self.sortType = sortType
        self.startRecordNo = startRecordNo
        self.tenantId = tenantId
        self.vehicleId = vehicleId
        
    }
    
}
