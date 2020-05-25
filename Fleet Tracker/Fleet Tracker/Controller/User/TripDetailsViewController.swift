//
//  TripDetailsViewController.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 05/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import UIKit

class TripDetailsViewController: BaseViewController {
    
   // public static let shared = TripDetailsViewController()
    
    @IBOutlet weak var tripDetailsTableView: UITableView!
    var safeAreaHeight:CGFloat?
    var vehicleData:VehicleData?
    var tripDetailsArray:[TripListByFilterModel] = []
    var tripManager = TripManager.shared
    var selectedTripDetail:TripListByFilterModel?
    var speedLimit:Int = 40
    var selectedDateFromCalendar:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tripDetailsTableView.dataSource = self
        tripDetailsTableView.delegate = self
        safeAreaHeight = self.view.frame.height - 150
        tripManager.tripDelegate = self
        
       if vehicleData != nil
       {
        if vehicleData!.LastConnectedLocalDateTime != nil{
        let date = formatDate(date: vehicleData!.LastConnectedLocalDateTime!)
        selectedDateFromCalendar = date
        print("Trimed date :: \(date)")
        
        
            let data =  TripListByFilterRequest(TenantId: 42, VehicleId: Int(vehicleData!.VehicleId!)! , RecordStartDateStr:"\(date) 00:00:00", RecordEndDateStr:"\(date) 23:59:59")
            BaseViewController.addActivitiIndicaterView()
                   TripManager.shared.getTripListByFilter(from: data.toJSON()!)
            
        }
        }
       
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.RefreshData), name: NSNotification.Name(rawValue: "RefreshTripDetailsViewController"), object: nil)
        
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // var calenderViewController = CalenderViewController.shared
        print("in prepare")
        if segue.identifier == "CalenderViewControllerSegue" {
            print("in prepare if")
            let calenderViewController = segue.destination as! CalenderViewController
            calenderViewController.calenderViewControllerDelegate = self
        }
    }
    
    
    @objc func RefreshData(_notification:Notification?)
    {
        print("in RefreshData")
        self.view.layoutIfNeeded()
        tripDetailsTableView.reloadData()
    }
    
    
    func formatDate(date:String) ->String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm:ss"
        let dateObj = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        print("Dateobj: \(dateFormatter.string(from: dateObj!))")
        return dateFormatter.string(from: dateObj!)
    }
    
  
    
}


extension TripDetailsViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            print("in cellForRowAt")
            let cell = tableView.dequeueReusableCell(withIdentifier: "TripDetailsFirstTableViewCell", for: indexPath) as! TripDetailsFirstTableViewCell
            //cell.mapView.isMyLocationEnabled = true
            //cell.mapView.settings.myLocationButton = true
            cell.mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
            cell.tripDetailsFirstTableViewCellDelegate = self
            cell.speedLimit = speedLimit
            if selectedTripDetail != nil{
                cell.selectedTripLocation.removeAll()
                for i in selectedTripDetail!.TripLocations!
                {
                    cell.selectedTripLocation.append(i)
                }
                cell.mapView.clear()
                cell.plotRouteOnMap()
            }
            
            if vehicleData != nil{
                cell.vehicleNameLabel.text = "Trip: \(vehicleData!.VehicleName!)"
            }
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TripDetailsSecondTableViewCell", for: indexPath) as! TripDetailsSecondTableViewCell
            cell.tripDetailsSecondTableViewCellDelegate = self
            cell.tripDetails.removeAll()
            cell.dateLabel.text = selectedDateFromCalendar
            BaseViewController.addActivitiIndicaterView()
            if tripDetailsArray.count != 0
            {
                cell.tripDetails = tripDetailsArray
            }
            
            BaseViewController.hideActivitiIndicaterView()

            cell.rideDetailsLabel.text = "Ride Details (\(tripDetailsArray.count))"
            cell.collectionView.reloadData()
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TripDetailsThirdTableViewCell", for: indexPath) as! TripDetailsThirdTableViewCell
            if selectedTripDetail != nil
            {
                cell.dateTime.removeAll()
                cell.speed.removeAll()
                cell.lineChartView.clear()
                cell.speedLimit = speedLimit
                for i in selectedTripDetail!.TripLocations!
                {
                    cell.speed.append(Int(i.Speed!))
                    cell.dateTime.append(i.RecordLocalDateTime!)
                    
                }
                cell.lineChartView.leftAxis.removeAllLimitLines()
                cell.drawChart(dataPoints: cell.dateTime, values: cell.speed.map{ Double($0)})
                
            }
            
            
            return cell
        }
        
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
}

extension TripDetailsViewController: UITableViewDelegate
{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            print("in ###")
            return safeAreaHeight!
            
        }
        else if indexPath.row == 1
        {
            return 400
        }else
        {
            return 600
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
    
    
}




extension TripDetailsViewController:TripDelegate
{
    func tripListByFilterResponse(isSuccess: Bool, error: String?, data: TripListByFilterResponse?) {
        
        tripDetailsArray.removeAll()
        let jsonData = data!.toJSON()!
        let json = try? JSONSerialization.data(withJSONObject:jsonData)
        if let jsonString = NSString(data: json!, encoding: String.Encoding.utf8.rawValue) as String? {
            if let object = TripListByFilterResponse.deserialize(from: jsonString) {
                if let finalData = object.data
                {
                    for i in finalData
                    {
                        tripDetailsArray.append(i)
                    }
                }
                
                
            }
        }
        if tripDetailsArray.count != 0{
        selectedTripDetail = tripDetailsArray[0]
        }
        DispatchQueue.main.async {
            self.tripDetailsTableView.reloadData()
            BaseViewController.hideActivitiIndicaterView()
        }
    }
    
    
}


extension TripDetailsViewController:TripDetailsSecondTableViewCellDelegate
{
    func showAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    
    func getSelectedTripDetailFromCollectionView(obj: TripListByFilterModel) {
        print("getSelectedTripDetailFromCollectionView  \(obj)")
        
        selectedTripDetail = obj
        print("selectedTripDetail \(selectedTripDetail?.toJSON())")
        DispatchQueue.main.async {
            self.tripDetailsTableView.reloadData()
            
        }
    }
    
    
    
    func getSearchedSpeedLimit(limit: Int) {
        
        print("getSearchedSpeedLimit :: \(limit)")
        
        
        speedLimit = limit
        
        DispatchQueue.main.async {
            self.tripDetailsTableView.reloadData()
            
        }
    }
    
}


extension TripDetailsViewController:CalenderViewControllerDelegate
{
    func getSelectedDateFromCalendar(date: String) {
        print("getSelectedDateFromCalendar :: \(date)")
        
        selectedDateFromCalendar = date
        let data =  TripListByFilterRequest(TenantId: 42, VehicleId: Int(vehicleData!.VehicleId!)! , RecordStartDateStr:"\(date) 00:00:00", RecordEndDateStr:"\(date) 23:59:59")
        TripManager.shared.getTripListByFilter(from: data.toJSON()!)
        BaseViewController.addActivitiIndicaterView()
        
    }
    
    
}

extension TripDetailsViewController:TripDetailsFirstTableViewCellDelegate
{
    func backButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
