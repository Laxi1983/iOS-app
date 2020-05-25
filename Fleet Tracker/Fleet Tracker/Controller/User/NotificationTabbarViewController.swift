//
//  NotificationTabbarViewController.swift
//  Fleet Tracker
//
//  Created by Ritesh Gupta on 18/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import UIKit

class NotificationTabbarViewController: UITabBarController {

    @IBOutlet weak var notificationTabBar: UITabBar!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     self.tabBar.layer.cornerRadius = 0
       UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Arial", size: 18)!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Arial", size: 18)!], for: .selected)
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -13)
    }
    
    
    override func viewDidLayoutSubviews() {
        tabBar.frame = CGRect(x: 0, y:100, width: tabBar.frame.size.width, height: 50)
        self.tabBar.tintColor = UIColor.black
        self.tabBar.barTintColor = UIColor.white
        super.viewDidLayoutSubviews()
    }


}
