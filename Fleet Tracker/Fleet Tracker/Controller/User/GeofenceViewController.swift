//
//  GeofenceViewController.swift
//  Fleet Tracker
//
//  Created by Ritesh Gupta on 21/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import UIKit

class GeofenceViewController: UIViewController {

        @IBOutlet weak var tableView: UITableView!
        
        
        @IBOutlet weak var searchBar: UISearchBar!
        
        
        @IBOutlet weak var tableViewTitleBaseView: UIView!
        var geofenceManager = GeofenceManager.shared
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()

            geofenceManager.geofenceDelegate = self
            tableView.dataSource = self
            tableView.delegate = self
            searchBar.delegate = self
            searchBar.barTintColor = UIColor.clear
            searchBar.backgroundColor = UIColor.clear
            searchBar.isTranslucent = true
            searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
           let tabBar = self.tabBarController!.tabBar
           tabBar.selectionIndicatorImage = UIImage().createSelectionIndicator(color: UIColor(named:"TabBarSelectionColor")!, size: CGSize(width: tabBar.frame.width/CGFloat(tabBar.items!.count), height: tabBar.frame.height), lineHeight: 3.0)
            
            
            
            let bottomLine = CALayer()
               bottomLine.frame = CGRect(x: 0.0, y: tableViewTitleBaseView.frame.height - 1, width: tableViewTitleBaseView.frame.width, height: 1.0)
            bottomLine.backgroundColor = UIColor(named: "LineSeperatorColor")?.cgColor
                tableViewTitleBaseView.layer.addSublayer(bottomLine)
        }
        
       
       
    }


    extension GeofenceViewController:UITableViewDataSource
    {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 2
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "GeofenceNotificationTableViewCell", for: indexPath) as! GeofenceNotificationTableViewCell
            cell.actionButton.layer.cornerRadius = 15
            cell.actionButton.layer.borderColor = UIColor(named: "SignInButtonBackgroundColor")?.cgColor
            cell.actionButton.layer.borderWidth = 2
            return cell
            
        }
        func numberOfSections(in tableView: UITableView) -> Int {
           return 1
        }
        
    }
    extension GeofenceViewController:UITableViewDelegate
    {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                  
               tableView.deselectRow(at: indexPath, animated: true)
              }
              
    }


    extension GeofenceViewController:UISearchBarDelegate
    {
        
    }

extension GeofenceViewController:GeofenceDelegate
{
    func getAlertsResponse(isSuccess: Bool, error: String?, data: AlertsResponse?) {
        
    }
    
    
}
