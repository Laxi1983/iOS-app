//
//  LoggedInUserBookingsRequest.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 17/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class LoggedInUserBookingsRequest: HandyJSON
{
    var tenantId: Int?
    var fleetId: Int?
    var bookingType: String?
    var approvalStatus: String?
    var sortColumnName: String?
    var sortType: String?
    var searchKey: String?
    var pageNo: Int?
    var pageSize: Int?
    var startRecordNo: Int?
    var isSearchTextLengthValid: Bool?
    required init() {
        
    }
    
    init(tenantId:Int,fleetId:Int, bookingType: String, approvalStatus: String, sortColumnName: String, sortType: String, searchKey: String,  pageNo: Int, pageSize: Int, startRecordNo: Int, isSearchTextLengthValid: Bool )
    {
        self.tenantId = tenantId
        self.fleetId=fleetId
        self.bookingType=bookingType
        self.approvalStatus=approvalStatus
        self.sortColumnName=sortColumnName
        self.sortType=sortType
        self.searchKey=searchKey
        self.pageNo=pageNo
        self.pageSize=pageSize
        self.startRecordNo=startRecordNo
        self.isSearchTextLengthValid=isSearchTextLengthValid
    }
    
}
