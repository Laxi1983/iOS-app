//
//  ViewController.swift
//  Fleet Tracker
//
//  Created by Sandip Mahajan on 05/12/19.
//  Copyright © 2019 Mobiliya. All rights reserved.
//

import UIKit
import MSAL
import JWTDecode
class LoginViewController: UIViewController {
    
    // Communication variables
    var userManager = UserManager.shared
    var fleetsManager = FleetsManager.shared
    var vehicleManager = VehicleManager.shared
    var reportManager = ReportManager.shared
    var tenantManager = TenantManager.shared
    var dashboardManager = DashboardManager.shared
    var tripManager = TripManager.shared
    var routeManager = RouteManager.shared
    var adHandler = AzureADHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userManager.userDelegate = self
        fleetsManager.fleetsDelegate = self
        vehicleManager.vehicleDelegate = self
        reportManager.reportDelegate = self
        tenantManager.tenantDelegate = self
        dashboardManager.dashboardDelegate = self
        tripManager.tripDelegate = self
        routeManager.routeDelegate = self
        adHandler.delegate = self
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    
    @IBAction func loginClick(_ sender: Any) {
        try? adHandler.initMSAL(controller: self)
    }
    
    
    @IBAction func getFleets(_ sender: Any) {
        
        print("###1 in getFleets")
        let data = FleetOwnerFleetListRequest(tenantId: 42)
        FleetsManager.shared.FleetOwnerFleetList(from: data.toJSON()!)
        
    }
    
    
    
    
    @IBAction func getVehicles(_ sender: Any) {
        print("###1 in getVehicles")
        let data = VehicleListByFilterRequest(tenantId: 42, fleetId: 56, sortColumnName: "index", sortType: "asc", searchKey: "", pageNo: 1, pageSize: 10, startRecordNo: 0, isSearchTextLengthValid: true)
        VehicleManager.shared.getVehicleListByFilter(from: data.toJSON()!)
        
    }
    
    
    
    
    
    
    @IBAction func GetBookingsClicked(_ sender: Any) {
        print("###1 in GetBookingsClicked")
        let data = LoggedInUserBookingsRequest(tenantId: 42, fleetId: 56, bookingType: "1,2,3", approvalStatus: "1,2,3,4", sortColumnName: "StartTime", sortType: "desc", searchKey: "", pageNo: 1, pageSize: 10, startRecordNo: 0, isSearchTextLengthValid: true)
        UserBookingsManager.shared.getLoggedInUserBookings(from: data.toJSON()!)
    }
    
    
    
    
    @IBAction func TenantVehicleFleetList(_ sender: Any) {
        
        print("###1 in TenantVehicleFleetList")
        let data = TenantVehicleFleetListRequest(tenantId: 42)
        FleetsManager.shared.TenantVehicleFleetList(from: data.toJSON()!)
    }
    
    
    
    
    
    
    
    
    
    @IBAction func pendingApprovals(_ sender: Any) {
        print("###1 in pendingApprovals")
        let data = PendingApprovalsRequest(tenantId: 42, fleetId: 57, bookingType: "1,2,3", approvalStatus: "1,2,3", sortColumnName: "StartTime", sortType: "desc", searchKey: "", pageNo: 1, pageSize: 10, startRecordNo: 0, isSearchTextLengthValid: true)
        VehicleManager.shared.getPendingApprovals(from: data.toJSON()!)
    }
    
    
    
    @IBAction func bookingStatusCount(_ sender: Any) {
        print("###1 in bookingStatusCount")
        let data = BookingStatusCountRequest(tenantId: 42, fleetId: 57)
        VehicleManager.shared.getBookingStatusCount(from: data.toJSON()!)
    }
    
    
    
    
    
    @IBAction func bookingSummary(_ sender: Any) {
        
        let data = BookingSummaryRequest(tenantId: 42, fleetId: 57, StartDate: "2020-04-20", EndDate: "2020-04-20", sortColumnName: "index", sortType: "asc", searchKey: "", pageNo: 1, pageSize: 10, startRecordNo: 0, isSearchTextLengthValid: true)
        
        VehicleManager.shared.getbookingSummary(from: data.toJSON()!)
    }
    
    
    
    
    @IBAction func VehicleListOfFleet(_ sender: Any) {
        let data = VehicleListOfFleetRequest(tenantId: 42, fleetId: 57, sortColumnName: "index", sortType: "asc", searchKey: "", pageNo: 1, pageSize: 10, startRecordNo: 0, isSearchTextLengthValid: true)
        FleetsManager.shared.VehicleListOfFleet(from: data.toJSON()!)
    }
    
    
    @IBAction func UtilizationReportData(_ sender: Any) {
        let data = UtilizationReportDataRequest(TenantId: 42, FleetId: 57, tenantId: 42, fleetId: 57, RecordStartDateStr: "2020-04-21 00:00:00", RecordEndDateStr: "2020-04-21 23:59:59", sortColumnName: "index", sortType:  "asc", searchKey: "", pageNo: 1, pageSize: 10, startRecordNo: 0, isSearchTextLengthValid: true)
        ReportManager.shared.getUtilizationReportData(from: data.toJSON()!)
    }
    
    
    
    
    
    @IBAction func FleetVehicle(_ sender: Any) {
        let data = FleetVehicleRequest(tenantId: 42, fleetId: 57)
        FleetsManager.shared.FleetVehicle(from: data.toJSON()!)
    }
    
    
    
    @IBAction func getTenantList(_ sender: Any) {
        
        TenantManager.shared.getTenantList(from:[:])
    }
    
    
    @IBAction func SADashboardSummary(_ sender: Any) {
        
        DashboardManager.shared.getSADashboardSummary(from: [:])
    }
    
    
    
    @IBAction func RoleBasedUserCount(_ sender: Any) {
        let data = RoleBasedUserCountRequest(tenantId: 88)
        UserManager.shared.getRoleBasedUserCount(from:data.toJSON()!)
    }
    
    
    
    
    @IBAction func VehicleDataAssociatedToDriver(_ sender: Any) {
        VehicleManager.shared.getVehicleDataAssociatedToDriver(from: [:])
        
    }
    
    
    
    
    
    @IBAction func TripListByFilter(_ sender: Any) {
        
        let data = TripListByFilterRequest(TenantId: 42, VehicleId: 35, RecordStartDateStr: "2020-04-17 00:00:00", RecordEndDateStr: "2020-04-17 23:59:59")
        TripManager.shared.getTripListByFilter(from: data.toJSON()!)
        
    }
    
    
    
    
    @IBAction func RouteList(_ sender: Any) {
        
        let data = RouteListRequest(tenantId: 88, fleetId: 1, sortColumnName:  "index", sortType: "asc", searchKey: "", pageNo: 1, pageSize: 10, startRecordNo: 0, isSearchTextLengthValid: true)
        
        RouteManager.shared.getRouteList(from: data.toJSON()!)
    }
    
    
    
    @IBAction func DeleteRoute(_ sender: Any) {
        let data = DeleteRouteRequest(routeId: 5, tenantId: 88)
        RouteManager.shared.deleteRoute(from: data.toJSON()!)
    }
    
    
    
    @IBAction func GetUsers(_ sender: Any) {
        let data = GetUserRequest(Role: 1, isSearchTextLengthValid: true, pageNo: 1, pageSize: 10, searchKey: "", sortColumnName: "index", sortType: "asc", startRecordNo: 0, tenantId: 42)
        UserManager.shared.getUsers(from: data.toJSON()!)
    }
    
    
    
    
}

extension LoginViewController : UserDelegate, MSALUserDelegate {
    
    
    
    func response(isSuccess: Bool, error: String, data: MSALUserModel?) {
        if isSuccess {
           
            do{
                let jwt = try decode(jwt: String(data: KeychainService.load(key: AUTH_TOKEN)! as Data, encoding: .utf8) ?? "")
               
                let mail = jwt.claim(name: "unique_name")
                let password:String = data!.password!
                let displayName = jwt.claim(name: "name")
                let id = jwt.claim(name: "oid")
                
                
                let userData = MSALUserModel(mail:mail.string! , displayName: displayName.string!, password: password, id: id.string!)
                
                let loginRequest = LoginRequest(from: userData)
                
                userManager.login(from: loginRequest.toJSON()!)
            }catch{
                
            }
        }
        else {
            print(error)
        }
    }
    
    func loginResponse(isSuccess: Bool, error: String?, data: UserResponse?) {
        let data = data!.toJSON()
        print("### in loginResponse data = \(data)")
        //print(error!)
    }
    
    func RoleBasedUserCountResponse(isSuccess: Bool, error: String?, data: RoleBasedUserCountResponse?) {
        
        print("###7 error = \(String(describing: error))")
        
        print("###7 FleetsResponse data = \(data?.toJSON()!)")
    }
    
    
    func usersResponse(isSuccess: Bool, error: String?, data: GetUserResponse?) {
        
        print("###7 error = \(String(describing: error))")
        
        print("###7 usersResponse data = \(data?.toJSON()!)")
    }
    
    
}

extension LoginViewController : FleetsDelegate
{
    
    
    
    func FleetOwnerFleetListResponse(isSuccess: Bool, error: String?, data: FleetResponse?) {
        
        print("###7 error = \(String(describing: error))")
        
        print("###7 FleetsResponse data = \(data?.toJSON()!)")
    }
    
    
    func TenantVehicleFleetListResponse(isSuccess: Bool, error: String?, data: TenantVehicleFleetListResponse?) {
        print("###7 error = \(String(describing: error))")
        
        print("###7 FleetsResponse data = \(data?.toJSON()!)")
    }
    
    
    func VehicleListOfFleet(isSuccess: Bool, error: String?, data: VehicleListOfFleetResponse?) {
        
        print("###7 error = \(String(describing: error))")
        
        print("###7 FleetsResponse data = \(data?.toJSON()!)")
    }
    
    
    
    func FleetVehicleResponse(isSuccess: Bool, error: String?, data: FleetVehicleResponse?) {
        print("###7 error1 = \(String(describing: error))")
        
        print("###7 FleetsResponse data1 = \(data?.toJSON()!)")
    }
    
    
    
    func TenantAdminFleetListResponse(isSuccess: Bool, error: String?, data: TenantAdminFleetListResponse?) {
        //Button remain
        print("###7 error1 = \(String(describing: error))")
        
        print("###7  data1 = \(data?.toJSON()!)")
    }
    
}


extension LoginViewController : VehicleDelegate
{
    
    
    
    
    
    func VehicleListResponse(isSuccess: Bool, error: String?, data: VehicleListByFilterResponse?) {
        print("###7 error = \(String(describing: error))")
        print("###7 VehicleListResponse data = \(data?.toJSON()!)")
    }
    
    
    func PendingApprovalsResponse(isSuccess: Bool, error: String?, data: PendingApprovalResponse?) {
        print("###7 error = \(String(describing: error))")
        print("###7 VehicleListResponse data = \(data?.toJSON()!)")
    }
    
    
    func BookingStatusCountResponse(isSuccess: Bool, error: String?, data: BookingStatusCountResponse?) {
        print("###7 error = \(String(describing: error))")
        print("###7 VehicleListResponse data = \(data?.toJSON()!)")
    }
    
    
    func bookingSummaryResponse(isSuccess: Bool, error: String?, data: BookingSummaryResponse?) {
        print("###7 error = \(String(describing: error))")
        print("###7 VehicleListResponse data = \(data?.toJSON()!)")
    }
    
    
    
    func VehicleDataAssociatedToDriverResponse(isSuccess: Bool, error: String?, data: VehicleDataAssociatedToDriverResponse?) {
        print("###7 error = \(String(describing: error))")
        print("###7 VehicleListResponse data = \(data?.toJSON()!)")
    }
    
    
    
    
    func TodaysBookingStatusCountResponse(isSuccess: Bool, error: String?, data: TodaysBookingStatusCountResponse?) {
        //Button remain
        print("###7 error1 = \(String(describing: error))")
        
        print("###7  data1 = \(data?.toJSON()!)")
    }
    
    func BookedVehicleCountResponse(isSuccess: Bool, error: String?, data: BookedVehicleCountResponse?) {
        //Button remain
        print("###7 error1 = \(String(describing: error))")
        
        print("###7  data1 = \(data?.toJSON()!)")
    }
    
    func SpecificBookingStatusResponse(isSuccess: Bool, error: String?, data: SpecificBookingStatusResponse?) {
        //Button remain
        print("###7 error1 = \(String(describing: error))")
        
        print("###7  data1 = \(data?.toJSON()!)")
    }
    
    func VehicleBookingSummaryResponse(isSuccess: Bool, error: String?, data: VehicleBookingSummaryResponse?) {
        //Button remain
        print("###7 error1 = \(String(describing: error))")
        
        print("###7  data1 = \(data?.toJSON()!)")
    }
    
    
    
}

extension LoginViewController : UserBookingsDelegate
{
    func UserBookingsResponse(isSuccess: Bool, error: String?, data: LoggedInUserBookingsResponse?) {
        
        print("###7 error = \(String(describing: error))")
        print("###7 VehicleListResponse data = \(data?.toJSON()!)")
        
    }
    
    
    
}
extension LoginViewController : ReportDelegate
{
    
    
    
    func UtilizationReportDataResponse(isSuccess: Bool, error: String?, data: UtilizationReportDataResponse?) {
        print("###7 error = \(String(describing: error))")
        print("###7 VehicleListResponse data = \(data?.toJSON()!)")
    }
    
    
    func SafetyReportDataResponse(isSuccess: Bool, error: String?, data: SafetyReportDataResponse?) {
        print("###7 error = \(String(describing: error))")
        print("###7 VehicleListResponse data = \(data?.toJSON()!)")
    }
    
    
    
    
    func VehicleHealthDataResponse(isSuccess: Bool, error: String?, data: VehicleHealthDataResponse?) {
        //Button remain
        print("###7 error1 = \(String(describing: error))")
        
        print("###7  data1 = \(data?.toJSON()!)")
    }
    
    func PowerBIReportsInfoResponse(isSuccess: Bool, error: String?, data: PowerBIReportsInfoResponse?) {
        //Button remain
        print("###7 error1 = \(String(describing: error))")
        
        print("###7  data1 = \(data?.toJSON()!)")
    }
    
}


extension LoginViewController : TenantDelegate
{
    func TenantListResponse(isSuccess: Bool, error: String?, data: TenantListResponse?) {
        print("###7 error = \(String(describing: error))")
        print("###7 TenantListResponse data = \(data?.toJSON()!)")
    }
    
    
}

extension LoginViewController : DashboardDelegate
{
    func SADashboardSummaryResponse(isSuccess: Bool, error: String?, data: SADashboardSummaryResponse?) {
        print("###7 error = \(String(describing: error))")
        print("###7 SADashboardSummaryResponse data = \(data?.toJSON()!)")
    }
    
    
}



extension LoginViewController : TripDelegate
{
    func tripListByFilterResponse(isSuccess: Bool, error: String?, data: TripListByFilterResponse?) {
        print("###7 error = \(String(describing: error))")
        print("###7 TripListByFilterResponse data = \(data?.toJSON()!)")
    }
    
    
}

extension LoginViewController : RouteDelegate
{
    
    
    func RouteListResponse(isSuccess: Bool, error: String?, data: RouteListResponse?) {
        print("###7 error = \(String(describing: error))")
        print("###7 RouteListResponse data = \(data?.toJSON()!)")
    }
    
    func DeleteRouteResponse(isSuccess: Bool, error: String?, data: DeleteRouteResponse?) {
        print("###7 error = \(String(describing: error))")
        print("###7 DeleteRouteResponse data = \(data?.toJSON()!)")
    }
    
}
