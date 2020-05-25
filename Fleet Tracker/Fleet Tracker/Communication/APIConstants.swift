//
//  APIConstants.swift
//  Fleet Tracker
//
//  Created by Sandip Mahajan on 05/12/19.
//  Copyright © 2019 Mobiliya. All rights reserved.
//

import Foundation

//let BASE_URL = URL(string: "https://undpfleetmanagement.azurewebsites.net/api")!

//let BASE_URL = URL(string: "https://undphq05wa002.azurewebsites.net/api")!


let BASE_URL = URL(string: "http://undphq06wa002.azurewebsites.net/api")!


let AUTH_TOKEN = "AUTH_TOKEN"

public enum HTTPMethod : String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

public enum APIServiceError: Error {
    case API_ERROR
    case INVALID_ENDPOINT
    case INVALID_RESPONSE
    case NO_DATA
    case DECODE_ERROR
}

let UserID = "UserID"
let Name = "Name"
let Email = "Email"
let MobileNumber = "MobileNumber"
let Password = "Password"
let TenantCode = "TenantCode"
let RoleId = "RoleId"
let TenantId = "TenantId"
let Status = "Status"
let UpdateBy = "UpdateBy"
let FleetList = "FleetList"
let Vehicle = "Vehicle"
let TenantName = "TenantName"
let PowerBIs = "PowerBIs"
let CountryCode = "CountryCode"
let CountryLatitude = "CountryLatitude"
let CountryLongitude = "CountryLongitude"

