//
//  EndPoint.swift
//  Fleet Tracker
//
//  Created by Sandip Mahajan on 06/12/19.
//  Copyright © 2019 Mobiliya. All rights reserved.
//

import Foundation

// Enum Endpoint
enum Endpoint: String, CaseIterable {
    //User
    case LOGIN = "/user/signin"
    case GET_ROLE_BASED_USER_COUNT = "/user/getRoleBasedUserCount"
    case GET_USERS = "/user/users"
    
    //Fleet
    case FLEET_OWNER_FLEET_LIST = "/fleet/getFleetOwnerFleetList"
    case GET_TENANT_VEHICLE_FLEET_LIST = "/fleet/getTenantVehicleFleetList"
    case GET_VEHICLE_LIST_OF_FLEET = "/fleet/getVehicleListOfFleet"
    case GET_FLEET_VEHICLE = "/fleet/getFleetVehicle"
    case GET_TENANT_ADMIN_FLEET_LIST = "/fleet/getTenantAdminFleetList"
    
    //Vehicle
    case GET_VEHICLE_LIST_BY_FILTER = "/vehicle/getVehicleListByFilter"
    case GET_PENDING_APPROVALS = "/vehicle/pendingApprovals"
    case GET_BOOKING_STATUS_COUNT = "/vehicle/getBookingStatusCount"
    case GET_BOOKING_SUMMARY = "/vehicle/bookingSummary"
    case GET_VEHICLE_DATA_ASSOCIATED_TO_DRIVER = "/vehicle/getVehicleDataAssociatedToDriver"
    case GET_TODAYS_BOOKING_STATUS_COUNT = "/vehicle/getTodaysBookingStatusCount"
    case GET_BOOKED_VEHICLE_COUNT = "/vehicle/getBookedVehicleCount"
    case GET_SPECIFIC_BOOKING_STATUS = "/vehicle/getSpecificBookingStatus"
    case GET_VEHICLE_BOOKING_SUMMARY = "/vehicle/getVehicleBookingSummary"
    
    //UserBookings
    case GET_LOGGEDIN_USER_BOOKINGS = "/vehicle/getLoggedInUserBookings"
    
    //Report
    case GET_UTILIZATION_REPORT_DATA = "/report/getUtilizationReportData"
    case GET_SAFETY_REPORT_DATA = "/report/getSafetyReportData"
    case GET_VEHICLE_HEALTH_DATA = "/report/getVehicleHealthData"
    case GET_POWER_BI_REPORTS_INFO = "/report/getPowerBIReportsInfo"
    
    //Tenant
    case GET_TENANT_LIST = "/tenant/getTenantList"
    
    //Dashboard
    case GET_SA_DASHBOARD_SUMMARY = "/dashboard/getSADashboardSummary"
    
    
    //Trip
    case GET_TRIP_LIST_BY_FILTER = "/trip/getTripListByFilter"
    
    //Route
    case GET_ROUTE_LIST = "/route/getRouteList"
    case DELETE_ROUTE = "/route/deleteRoute"
    
    //Geofence
     case ALERTS = "/geofence/alerts"
    
}
