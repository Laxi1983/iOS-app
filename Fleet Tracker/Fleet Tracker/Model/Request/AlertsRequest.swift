//
//  AlertsRequest.swift
//  Fleet Tracker
//
//  Created by Ritesh Gupta on 22/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class AlertsRequest: HandyJSON
{
   var AlertType: Int?
    var RecordEndDateStr: String?
    var RecordStartDateStr: String?
    var TenantId: Int?
    var UserId: Int?
    var VehicleId: Int?
    var isSearchTextLengthValid: Bool?
    var pageNo: Int?
    var pageSize: Int?
    var searchKey: String?
    var sortColumnName: String?
    var sortType: String?
    var startRecordNo: Int?
    
    required init() {
        
    }
    
    init( AlertType: Int, RecordEndDateStr: String, RecordStartDateStr: String,TenantId: Int,UserId: Int,VehicleId: Int, isSearchTextLengthValid:Bool, pageNo: Int, pageSize: Int, searchKey: String, sortColumnName: String, sortType: String, startRecordNo: Int)
    {
        self.AlertType = AlertType
        self.RecordEndDateStr = RecordEndDateStr
        self.RecordStartDateStr = RecordStartDateStr
        self.TenantId = TenantId
        self.UserId = UserId
        self.VehicleId = VehicleId
        self.isSearchTextLengthValid = isSearchTextLengthValid
        self.pageNo = pageNo
        self.pageSize = pageSize
        self.searchKey = searchKey
        self.sortColumnName = sortColumnName
        self.sortType = sortType
        self.startRecordNo = startRecordNo
       
        
    }
    
}
