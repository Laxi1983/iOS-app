//
//  EventsViewController.swift
//  Fleet Tracker
//
//  Created by Ritesh Gupta on 19/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var tableViewTitleBaseView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        searchBar.barTintColor = UIColor.clear
        searchBar.backgroundColor = UIColor.clear
        searchBar.isTranslucent = true
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
       let tabBar = self.tabBarController!.tabBar
       tabBar.selectionIndicatorImage = UIImage().createSelectionIndicator(color: UIColor.blue, size: CGSize(width: tabBar.frame.width/CGFloat(tabBar.items!.count), height: tabBar.frame.height), lineHeight: 2.0)
        
        
        
        let bottomLine = CALayer()
           bottomLine.frame = CGRect(x: 0.0, y: tableViewTitleBaseView.frame.height - 1, width: tableViewTitleBaseView.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor(named: "LineSeperatorColor")?.cgColor
            tableViewTitleBaseView.layer.addSublayer(bottomLine)
    }
    
   
   
}


extension EventsViewController:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
        cell.actionButton.layer.cornerRadius = 10
        cell.actionButton.layer.borderColor = UIColor(named: "SignInButtonBackgroundColor")?.cgColor
        cell.actionButton.layer.borderWidth = 2
        return cell
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
}
extension EventsViewController:UITableViewDelegate
{
    
}


extension EventsViewController:UISearchBarDelegate
{
    
}


extension UIImage {
    func createSelectionIndicator(color: UIColor, size: CGSize, lineHeight: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(origin: CGPoint(x: 0,y :size.height - lineHeight), size: CGSize(width: size.width, height: lineHeight)))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
