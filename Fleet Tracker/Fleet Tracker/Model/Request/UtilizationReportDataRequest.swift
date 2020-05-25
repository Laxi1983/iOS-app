//
//  UtilizationReportDataRequest.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 21/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class UtilizationReportDataRequest: HandyJSON
{
    var TenantId: Int?
    var FleetId: Int?
    var tenantId: Int?
    var fleetId: Int?
    var RecordStartDateStr: String?
    var RecordEndDateStr: String?
    var sortColumnName: String?
    var sortType: String?
    var searchKey: String?
    var pageNo: Int?
    var pageSize: Int?
    var startRecordNo: Int?
    var isSearchTextLengthValid: Bool?
    
    required init() {
        
    }
    
    init(TenantId:Int,FleetId:Int, tenantId: Int, fleetId: Int, RecordStartDateStr: String, RecordEndDateStr: String, sortColumnName: String, sortType: String, searchKey:String ,pageNo:Int, pageSize:Int, startRecordNo:Int, isSearchTextLengthValid:Bool)
    {
        self.TenantId = TenantId
        self.FleetId=FleetId
        self.tenantId=tenantId
        self.fleetId=fleetId
        self.RecordStartDateStr=RecordStartDateStr
        self.RecordEndDateStr=RecordEndDateStr
        self.sortColumnName=sortColumnName
        self.sortType=sortType
        self.searchKey=searchKey
        self.pageNo=pageNo
        self.pageSize=pageSize
        self.startRecordNo=startRecordNo
        self.isSearchTextLengthValid=isSearchTextLengthValid
    }
    
}
