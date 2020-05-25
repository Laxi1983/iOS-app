//
//  BookingSummaryRequest.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 20/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class BookingSummaryRequest: HandyJSON
{
    var tenantId: Int?
    var fleetId: Int?
    var StartDate: String?
    var EndDate: String?
    var sortColumnName: String?
    var sortType: String?
    var searchKey: String?
    var pageNo: Int?
    var pageSize: Int?
    var startRecordNo: Int?
    var isSearchTextLengthValid: Bool?
    required init() {
        
    }
    
    init(tenantId:Int,fleetId:Int, StartDate: String, EndDate: String, sortColumnName: String, sortType: String, searchKey: String,  pageNo: Int, pageSize: Int, startRecordNo: Int, isSearchTextLengthValid: Bool )
    {
        self.tenantId = tenantId
        self.fleetId=fleetId
        self.StartDate=StartDate
        self.EndDate=EndDate
        self.sortColumnName=sortColumnName
        self.sortType=sortType
        self.searchKey=searchKey
        self.pageNo=pageNo
        self.pageSize=pageSize
        self.startRecordNo=startRecordNo
        self.isSearchTextLengthValid=isSearchTextLengthValid
    }
    
}
