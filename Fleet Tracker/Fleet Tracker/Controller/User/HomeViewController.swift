//
//  DashboardViewController.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 28/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import UIKit
class HomeViewController: BaseViewController {
    
    //  public static let shared = HomeViewController()
    
    @IBOutlet weak var tableView: UITableView!
    var safeAreaHeight:CGFloat?
    var status:Bool = false
    var healthy:Int = 0
    var faulty:Int = 0
    var online:Int = 0
    var offline:Int = 0
    
    var availableVehiclesArray:[VehicleData] = []
    var vehicleManager = VehicleManager.shared
    var selectedDropdownFleetId:Int = 0
    var secondTableViewCellHeight = 220
    //var VehiclesArray:[VehicleData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        BaseViewController.hideActivitiIndicaterView()
        safeAreaHeight = self.view.frame.height - self.topLayoutGuide.length - self.bottomLayoutGuide.length - self.tabBarController!.tabBar.frame.size.height
        
        self.vehicleManager.vehicleDelegate = self
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
    }
    
    
    
}

extension HomeViewController:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            print("in cellForRowAt")
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeFirstTableviewCell", for: indexPath) as! HomeFirstTableviewCell
            // cell.mapView.isMyLocationEnabled = true
            //cell.mapView.settings.myLocationButton = true
            cell.mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
            cell.mapView.clear()
            cell.VehiclesArray.removeAll()
            for index in availableVehiclesArray
            {
                cell.VehiclesArray.append(index)
            }
            cell.plotMarkerOnGoogleMap()
            print("googlemapVehiclesArray \(cell.VehiclesArray.toJSON())")
            
            
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSecondTableviewCell", for: indexPath) as! HomeSecondTableviewCell
            cell.homeSecondTableviewCellDelegate = self
            cell.healthyCountText.text = "Healthy: \(healthy)"
            cell.faultyCountText.text = "Faulty: \(faulty)"
            cell.onlineCountText.text = "Online: \(online)"
            cell.offlineCountText.text = "Offline: \(offline)"
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeThirdTableviewCell", for: indexPath) as! HomeThirdTableviewCell
            cell.homeThirdTableviewCellDelegate = self
//            cell.VehiclesArray.removeAll()
//            for index in availableVehiclesArray
//            {
//                cell.VehiclesArray.append(index)
//            }
            
            if availableVehiclesArray.count != 0
            {
                cell.collectionView.dataSource = self
                cell.collectionView.delegate = self
            }
            
            cell.collectionView.reloadData()
            print("availableVehiclesArray :: \(availableVehiclesArray.toJSON())")
            
            
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
}

extension HomeViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            print("in ###")
            return safeAreaHeight!
            
        }
        else if indexPath.row == 1
        {
            return CGFloat(secondTableViewCellHeight)
        }else
        {
            return 400
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
    
}


extension HomeViewController:HomeSecondTableviewCellDelegate
{
   
    
    func getFleetId(fleetId: Int) {
        secondTableViewCellHeight = 220
        selectedDropdownFleetId = fleetId
        print("$$$ in HomeViewController:getFleetId::  \(fleetId)")
        availableVehiclesArray.removeAll()
         let tenantId = UserDefaults.standard.integer(forKey: TenantId)
        BaseViewController.addActivitiIndicaterView()
        //for page in 1 ... 10{
           // print("page = \(page)")
        let data = VehicleListByFilterRequest(tenantId: tenantId, fleetId: fleetId, sortColumnName: "index", sortType: "asc", searchKey: "", pageNo: 1, pageSize: 10, startRecordNo: 0, isSearchTextLengthValid: true)
        VehicleManager.shared.getVehicleListByFilter(from: data.toJSON()!)
       // }
    }
    
    
    
    func showDropdownButtonClicked() {
        secondTableViewCellHeight = 360
        DispatchQueue.main.async {
                   self.tableView.reloadData()
               }
       }
    
}

extension HomeViewController:HomeThirdTableviewCellDelegate
{
    func getSearchedText(text: String) {
        print("getSearchedText:: \(text)")
        
        availableVehiclesArray.removeAll()
        let tenantId = UserDefaults.standard.integer(forKey: TenantId)
        BaseViewController.addActivitiIndicaterView()
        let data = VehicleListByFilterRequest(tenantId: tenantId, fleetId: selectedDropdownFleetId, sortColumnName: "index", sortType: "asc", searchKey: text, pageNo: 1, pageSize: 10, startRecordNo: 0, isSearchTextLengthValid: true)
        VehicleManager.shared.getVehicleListByFilter(from: data.toJSON()!)
    }
    
    
}



extension HomeViewController : VehicleDelegate
{
    func VehicleListResponse(isSuccess: Bool, error: String?, data: VehicleListByFilterResponse?) {
        print("###7 error = \(String(describing: error))")
        print("###7 VehicleListResponse data = \(data!.toJSON()!)")
        
        let jsonData = data!.toJSON()!
        let json = try? JSONSerialization.data(withJSONObject:jsonData)
        if let jsonString = NSString(data: json!, encoding: String.Encoding.utf8.rawValue) as String? {
            if let object = VehicleListByFilterResponse.deserialize(from: jsonString) {
                if let finalData = object.data
                {
                    healthy = (finalData.TotalVehiclesCount! - finalData.FaultyVehiclesCount!)
                    faulty = finalData.FaultyVehiclesCount!
                    online = finalData.RunningVehiclesCount!
                    offline = (finalData.TotalVehiclesCount! - finalData.RunningVehiclesCount!)
                    
                    for i in finalData.VehicleInfo!
                    {
                        availableVehiclesArray.append(i)
                    }
                }
                
            }
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            BaseViewController.hideActivitiIndicaterView()
        }
        
    }
    
    func PendingApprovalsResponse(isSuccess: Bool, error: String?, data: PendingApprovalResponse?) {
        
    }
    
    func BookingStatusCountResponse(isSuccess: Bool, error: String?, data: BookingStatusCountResponse?) {
        
    }
    
    func bookingSummaryResponse(isSuccess: Bool, error: String?, data: BookingSummaryResponse?) {
        
    }
    
    func VehicleDataAssociatedToDriverResponse(isSuccess: Bool, error: String?, data: VehicleDataAssociatedToDriverResponse?) {
        
    }
    
    func TodaysBookingStatusCountResponse(isSuccess: Bool, error: String?, data: TodaysBookingStatusCountResponse?) {
        
    }
    
    func BookedVehicleCountResponse(isSuccess: Bool, error: String?, data: BookedVehicleCountResponse?) {
        
    }
    
    func SpecificBookingStatusResponse(isSuccess: Bool, error: String?, data: SpecificBookingStatusResponse?) {
        
    }
    
    func VehicleBookingSummaryResponse(isSuccess: Bool, error: String?, data: VehicleBookingSummaryResponse?) {
        
    }
    
}


extension HomeViewController:UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return availableVehiclesArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("!!!!")
        let cell : VehicleDetailsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "VehicleDetailsCollectionViewCell", for: indexPath) as! VehicleDetailsCollectionViewCell
        print("VehiclesArray :: \(availableVehiclesArray.toJSON())")

        var distance = availableVehiclesArray[indexPath.row].Odometer
        cell.nameLabel.text = availableVehiclesArray[indexPath.row].VehicleName
        cell.lastSeenLabel.text = availableVehiclesArray[indexPath.row].LastConnectedLocalDateTime
        
        let string = NSString(string: "\(availableVehiclesArray[indexPath.row].Odometer)")
        let x = string.doubleValue
        let y = Double(round(1000*x)/1000)
        cell.distanceLabel.text = String(y)
        cell.layer.shadowColor = UIColor(named: "CellShadowColor")?.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        
        cell.layer.borderColor = UIColor(named: "SearchBarBorderColor")?.cgColor
        cell.layer.borderWidth = 1
        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
}
extension HomeViewController:UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("!!! indexPath  \(indexPath.row)")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TripDetailsViewController") as! TripDetailsViewController
        vc.vehicleData = availableVehiclesArray[indexPath.row]

      present(vc, animated: true, completion: nil)



    }
   
   
}
