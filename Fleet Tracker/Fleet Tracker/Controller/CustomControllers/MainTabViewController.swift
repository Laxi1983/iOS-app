//
//  MainTabViewController.swift
//  Fleet Tracker
//
//  Created by Nandini Mane on 22/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadTabBar()
    }
    
    internal func loadTabBar() {
        if let vcDashboard = GUIService.shared.showDashboardViewController(),
            let vcNotification = GUIService.shared.showNotificationController(),
            let vcBookings = GUIService.shared.showVehicleBokingViewController(),
            let vcReports = GUIService.shared.showReportsController(),
            let vcProfile = GUIService.shared.showUserProfileController(){
            
            let dashboardNavigation = UINavigationController(rootViewController: vcDashboard)
            let notificationNavigation = UINavigationController(rootViewController: vcNotification)
            let bookingsNavigation = UINavigationController(rootViewController: vcBookings)
            let reportNavigation = UINavigationController(rootViewController: vcReports)
            let profileNavigation = UINavigationController(rootViewController: vcProfile)
            
            dashboardNavigation.tabBarItem = UITabBarItem(title: "Dashboard", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))//UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
            notificationNavigation.tabBarItem = UITabBarItem(title: "Notification", image: UIImage(named: "DropDownArrow"), selectedImage: UIImage(named: "DropDownArrow"))
            bookingsNavigation.tabBarItem = UITabBarItem(title: "Bookings", image: UIImage(named: "RefreshIcon"), selectedImage: UIImage(named: "RefreshIcon"))
            reportNavigation.tabBarItem = UITabBarItem(title: "Reports", image: UIImage(named: "SearchTab"), selectedImage: UIImage(named: "SearchTab"))
            profileNavigation.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "filterDarkImage"), selectedImage: UIImage(named: "filterDarkImage"))
            
            if let user = UserManager.shared.user {
                if let role = user.RoleId {
                    switch role {
                    case UserRole.SUPER_ADMIN.rawValue:
                        self.viewControllers = [dashboardNavigation,bookingsNavigation,reportNavigation,notificationNavigation,profileNavigation]
                        break
                    case UserRole.TENANT_ADMIN.rawValue:
                        self.viewControllers = [dashboardNavigation,bookingsNavigation,reportNavigation,notificationNavigation,profileNavigation]
                        break
                    case UserRole.FLEET_OWNER.rawValue:
                        self.viewControllers = [dashboardNavigation,bookingsNavigation,reportNavigation,notificationNavigation,profileNavigation]
                        break
                    case UserRole.DRIVER.rawValue:
                        self.viewControllers = [dashboardNavigation,bookingsNavigation,notificationNavigation,profileNavigation]
                        break
                    case UserRole.PASSENGER.rawValue:
                        self.viewControllers = [bookingsNavigation,profileNavigation]
                        break
                    default:
                        break
                    }
                }
            }
        }
    }
}
