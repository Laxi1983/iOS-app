//
//  HomeThirdTableviewCell.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 29/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import UIKit




protocol HomeThirdTableviewCellDelegate {
    func getSearchedText(text:String)
}



class HomeThirdTableviewCell: UITableViewCell {
    
    
    @IBOutlet weak var baseSearchView: UIView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var viewAllButton: UIButton!
    
    
    @IBOutlet weak var collectionBaseView: UIView!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var homeThirdTableviewCellDelegate:HomeThirdTableviewCellDelegate?
    
    var VehiclesArray:[VehicleData] = []
    var fleetId:Int?
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            //self.collectionView.dataSource = self
           // self.collectionView.delegate = self
            self.searchBar.delegate = self
            self.viewAllButton.isHidden = true
            self.searchBar.barTintColor = UIColor.clear
            self.searchBar.backgroundColor = UIColor.clear
            self.searchBar.isTranslucent = true
            self.searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
            
            
            
            self.collectionView.register(UINib(nibName: "VehicleDetailsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VehicleDetailsCollectionViewCell")
            self.collectionView.showsHorizontalScrollIndicator = false
            
        }
    }
    
    
    
    
    
}





extension HomeThirdTableviewCell:UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText \(searchText)")
        if searchBar.text != nil{
            if searchBar.text!.count > 2
            {
                print("searchText \(searchBar.text!)")
                homeThirdTableviewCellDelegate?.getSearchedText(text: searchBar.text!)
            }
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text != nil{
            if searchBar.text!.count > 2
            {
                print("searchText \(searchBar.text!)")
                homeThirdTableviewCellDelegate?.getSearchedText(text: searchBar.text!)
            }
            else
            {
                let alert = UIAlertController(title: "Alert", message: "Please Search min 3 letters.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.window?.rootViewController?.present(alert, animated: true, completion: nil)
                
            }
        }
        
    }
}


