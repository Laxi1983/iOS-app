//
//  RouteListModel.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 22/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class RouteListModel: HandyJSON {
    var routeName: String?
    var tenantId: Int?
    var RouteId:Int?
    var fleetId: Int?
    var CreatedBy: Int?
    var locations: [Locations]?
    var CreatedOn:String?
    var UpdatedBy:Int?
    var UploadOn: String?
    var sortColumnName: String?
    var startRecordNo: String?
    var sortType: String?
    var searchKey: String?
    var pageNo:Int?
    var pageSize: Int?
    required init() {
        
    }
}



class Locations: HandyJSON {
    
    var index: Int?
    var name: String?
    var formattedAddress:String?
    var lat: Double?
    var lng: Double?
    
    
    required init() {
        
    }
}
