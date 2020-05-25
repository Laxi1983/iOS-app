//
//  NotificationViewController.swift
//  Fleet Tracker
//
//  Created by Nandini Mane on 22/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import UIKit

class NotificationViewController: BaseViewController {

    @IBOutlet weak var interfaceSegmented: CustomSegmentedControl!{
        didSet{
            interfaceSegmented.setButtonTitles(buttonTitles: ["Events","Faults","Geofence"])
            interfaceSegmented.selectorViewColor = .orange
            interfaceSegmented.selectorTextColor = .orange
            interfaceSegmented.delegate = self
        }
    }
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
//       let tabBar = self.tabBarController!.tabBar
//       tabBar.selectionIndicatorImage = UIImage().createSelectionIndicator(color: UIColor.blue, size: CGSize(width: tabBar.frame.width/CGFloat(tabBar.items!.count), height: tabBar.frame.height), lineHeight: 2.0)
//
//
//
//        let bottomLine = CALayer()
//           bottomLine.frame = CGRect(x: 0.0, y: tableViewTitleBaseView.frame.height - 1, width: tableViewTitleBaseView.frame.width, height: 1.0)
//        bottomLine.backgroundColor = UIColor(named: "LineSeperatorColor")?.cgColor
//            tableViewTitleBaseView.layer.addSublayer(bottomLine)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension NotificationViewController:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventsNotificationTableViewCell", for: indexPath) as! EventsNotificationTableViewCell
        
        cell.actionButton.layer.cornerRadius = 10
        cell.actionButton.layer.borderColor = UIColor(named: "SignInButtonBackgroundColor")?.cgColor
        cell.actionButton.layer.borderWidth = 2
        return cell
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
}
extension NotificationViewController:UITableViewDelegate
{
    
}


extension NotificationViewController:UISearchBarDelegate
{
    
}

extension NotificationViewController:CustomSegmentedControlDelegate {
    func changeToIndex(index: Int) {
        print("Selected Index = \(index)")
    }
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

