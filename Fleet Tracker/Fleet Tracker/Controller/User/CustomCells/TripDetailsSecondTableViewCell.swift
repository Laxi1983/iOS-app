//
//  TripDetailsSecondTableViewCell.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 05/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import UIKit

protocol TripDetailsSecondTableViewCellDelegate {
    
    func getSelectedTripDetailFromCollectionView(obj:TripListByFilterModel)
    func getSearchedSpeedLimit(limit:Int)
    func showAlert(title:String, message:String);
}





class TripDetailsSecondTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var rideDetailsLabel: UILabel!
    
    @IBOutlet weak var refreshButton: UIButton!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var dateSettingBaseView: UIView!
    
    @IBOutlet weak var calenderButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var viewAllButton: UIButton!
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var tripDetails:[TripListByFilterModel] = []
    
    var tripDetailsSecondTableViewCellDelegate:TripDetailsSecondTableViewCellDelegate?
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.collectionView.dataSource = self
            self.collectionView.delegate = self
            self.searchBar.delegate = self
            self.searchBar.delegate = self
            self.searchBar.barTintColor = UIColor.clear
            self.searchBar.backgroundColor = UIColor.clear
            self.searchBar.isTranslucent = true
            self.searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
            
                print("&&&")
        
            self.collectionView.register(UINib(nibName: "RideDetailsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RideDetailsCollectionViewCell")
            self.collectionView.reloadData()
            self.collectionView.showsHorizontalScrollIndicator = false
         
           
        }
        
        
      
        
        
    
    }
    

    
    @IBAction func refreshButtonClicked(_ sender: Any) {
        
        NotificationCenter.default.post(name: NSNotification.Name("RefreshTripDetailsViewController"), object: nil)
    }
    
    
    
}

extension TripDetailsSecondTableViewCell:UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tripDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : RideDetailsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RideDetailsCollectionViewCell", for: indexPath) as! RideDetailsCollectionViewCell
        if tripDetails.count != 0
        {
            cell.depatLabel.text = tripDetails[indexPath.row].StartLocalTime
            cell.arriveLabel.text = tripDetails[indexPath.row].EndLocalTime
            cell.milesLabel.text = "\(tripDetails[indexPath.row].TripDistance!)"
            cell.fuelsLabel.text = "\(tripDetails[indexPath.row].FuelDifference!)"
        }
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

extension TripDetailsSecondTableViewCell:UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("!!! indexPath  \(indexPath.row)")
         tripDetailsSecondTableViewCellDelegate?.getSelectedTripDetailFromCollectionView(obj: tripDetails[indexPath.row])
    }
    
    
}


extension TripDetailsSecondTableViewCell:UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText \(searchText)")
        if searchBar.text != nil{
            if searchBar.text?.count != 0{
            if (Int(searchBar.text!)! > 39 && Int(searchBar.text!)! < 101)
            {
                print("searchBarSearchButtonClicked in if \(Int(searchBar.text!)!)")
                print("searchText \(searchBar.text!)")
                tripDetailsSecondTableViewCellDelegate?.getSearchedSpeedLimit(limit: Int(searchBar.text!)!)
            }
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // speed limit only between 40 to 100
        if searchBar.text != nil{
            if (Int(searchBar.text!)! > 39 && Int(searchBar.text!)! < 101)
            {
                print("searchBarSearchButtonClicked in if \(Int(searchBar.text!)!)")
                print("searchText \(searchBar.text!)")
                tripDetailsSecondTableViewCellDelegate?.getSearchedSpeedLimit(limit: Int(searchBar.text!)!)
            }else{
                print("searchBarSearchButtonClicked in else")
                
                tripDetailsSecondTableViewCellDelegate?.showAlert(title: "Alert", message: "Please enter valid speed limit 40 to 100 ")
                
            }
            
        }
        
    }
}
