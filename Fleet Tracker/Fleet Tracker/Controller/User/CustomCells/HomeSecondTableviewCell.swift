//
//  HomeSecondTableviewCell.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 29/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import UIKit


protocol HomeSecondTableviewCellDelegate
{
    func getFleetId(fleetId:Int)
    func showDropdownButtonClicked()
}




class HomeSecondTableviewCell: UITableViewCell {
    
    @IBOutlet weak var selectedFleetName: UILabel!
    
    @IBOutlet weak var dropdownButton: UIButton!
    
    @IBOutlet weak var dropDownTableView: UITableView!
    
    @IBOutlet weak var healthyCountText: UILabel!
    
    @IBOutlet weak var faultyCountText: UILabel!
    
    
    
    @IBOutlet weak var onlineCountText: UILabel!
    
    
    @IBOutlet weak var offlineCountText: UILabel!
    
    
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    
    var fleetsManager = FleetsManager.shared
    var homeSecondTableviewCellDelegate: HomeSecondTableviewCellDelegate?
    var fleetNameArray:[String] = []
    var fleetDict:[String:Int] = [:]
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("### in init2")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.fleetsManager.fleetsDelegate = self
            
            //Request for FleetOwnerFleetList data
            let tenantId = UserDefaults.standard.integer(forKey: TenantId)
            print("**tenantId ::\(tenantId)")
            let data = FleetOwnerFleetListRequest(tenantId: tenantId)
            FleetsManager.shared.FleetOwnerFleetList(from: data.toJSON()!)
            self.dropDownTableView.dataSource = self
            self.dropDownTableView.delegate = self
            self.dropDownTableView.layer.masksToBounds = true
            self.dropDownTableView.layer.borderColor = UIColor(named: "LightGray")?.cgColor
            self.dropDownTableView.layer.borderWidth = 2.0
            
            self.selectedFleetName.layer.borderColor = UIColor(named: "LightGray")?.cgColor
            self.selectedFleetName.layer.borderWidth = 2.0
            
            
            
            //  self.dropDownTableView.isHidden = true
            self.hideTableView()
            
        }
        
    }
    
    
    
    
    @IBAction func dropdownButtonClicked(_ sender: Any) {
        
        //self.dropDownTableView.isHidden = false
        showTableview()
    }
    
    
    
    
    func hideTableView()
    {
        tableViewHeight.constant = 0
        self.dropDownTableView.isHidden = true
        
    }
    
    func showTableview()
    {
        dropDownTableView.reloadData()
        homeSecondTableviewCellDelegate?.showDropdownButtonClicked()
        
        self.tableViewHeight.constant = 140
        self.dropDownTableView.isHidden = false
    }
    
    
    
    
    
    func settingDefaultFleetNameFromDropdown()
    {
        print("in settingDefaultFleetNameFromDropdown()")
        if self.fleetNameArray.count != 0
        {
            let indexPath = IndexPath(row: 0, section: 0)
            self.selectedFleetName.text = self.fleetNameArray[indexPath.row]
            let fleetId = self.fleetDict["\(self.fleetNameArray[indexPath.row])"]!
            print("settingDefaultFleetNameFromDropdown fleetId = \(fleetId)")
            self.homeSecondTableviewCellDelegate?.getFleetId(fleetId: fleetId)
            self.dropDownTableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
        }
        
        
    }
    
}

extension HomeSecondTableviewCell:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fleetNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("### in DropdownTableViewCell1 \(indexPath.row)")
        var cell = dropDownTableView.dequeueReusableCell(withIdentifier: "DropdownTableViewCell", for: indexPath) as! DropdownTableViewCell
        
        print("### in DropdownTableViewCell2  \(fleetNameArray[indexPath.row]) ")
        cell.name.text = fleetNameArray[indexPath.row]
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
}



extension HomeSecondTableviewCell:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        print("### in didSelectRowAt \(indexPath.row)")
        selectedFleetName.text = fleetNameArray[indexPath.row]
        print("### selectedFleetName  \(fleetNameArray[indexPath.row])")
        let fleetId = fleetDict["\(fleetNameArray[indexPath.row])"]!
        
        print("### fleetId  \(String(describing: fleetId))")
        
        homeSecondTableviewCellDelegate?.getFleetId(fleetId: fleetId)
        hideTableView()
    }
    
    
    
    
    
}


extension HomeSecondTableviewCell : FleetsDelegate
{
    func FleetOwnerFleetListResponse(isSuccess: Bool, error: String?, data: FleetResponse?) {
        
        print("###7 error = \(String(describing: error))")
        print("###7 FleetOwnerFleetListResponse data = \(data!.toJSON()!)")
        
        let jsonData = data!.toJSON()!
        let json = try? JSONSerialization.data(withJSONObject:jsonData)
        if let jsonString = NSString(data: json!, encoding: String.Encoding.utf8.rawValue) as String? {
            if let object = FleetResponse.deserialize(from: jsonString) {
                if let finalData = object.data
                {
                    for i in finalData
                    {
                        fleetNameArray.append(i.FleetName!)
                        fleetDict[i.FleetName!] = i.FleetId
                        
                    }
                }
                
                print("fleetNameArray :: \(fleetNameArray)")
                
            }
        }
        
        
        DispatchQueue.main.async {
            self.dropDownTableView.reloadData()
            self.settingDefaultFleetNameFromDropdown()
            
        }
    }
    
    
    func TenantVehicleFleetListResponse(isSuccess: Bool, error: String?, data: TenantVehicleFleetListResponse?) {
        
    }
    
    
    func VehicleListOfFleet(isSuccess: Bool, error: String?, data: VehicleListOfFleetResponse?) {
        
    }
    
    
    
    func FleetVehicleResponse(isSuccess: Bool, error: String?, data: FleetVehicleResponse?) {
        
    }
    
    
    
    func TenantAdminFleetListResponse(isSuccess: Bool, error: String?, data: TenantAdminFleetListResponse?) {
    }
    
}



