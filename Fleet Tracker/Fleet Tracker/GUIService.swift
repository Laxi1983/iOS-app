//
//  GUIService.swift
//  Fleet Tracker
//
//  Created by Nandini Mane on 22/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import UIKit

enum Storyboard: String {
    case Main
    case Dashboard
    case Notification
    case VehicleBooking
    case Reports
    case ProfileSettings
}

extension Storyboard {
    private func object() -> UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
    
    func instantiateViewController(with identifier: String) -> UIViewController {
        return self.object().instantiateViewController(withIdentifier: identifier)
    }
}

class GUIService: NSObject {
    
    static let shared = GUIService()
    var mainWindow: UIWindow? = (UIApplication.shared.delegate?.window)!
    
    
    func showDashboardViewController() -> HomeViewController? {
        if let vcHomeViewController = Storyboard.Dashboard.instantiateViewController(with: HomeViewController.identifier) as? HomeViewController {
            return vcHomeViewController
        }
        return nil
    }
    
    func showNotificationController() -> NotificationViewController? {
        if let vcNotificationViewController = Storyboard.Notification.instantiateViewController(with: NotificationViewController.identifier) as? NotificationViewController {
            return vcNotificationViewController
        }
        return nil
    }
    
    func showReportsController() -> ReportsViewController? {
        if let vcReportsViewController = Storyboard.Reports.instantiateViewController(with: ReportsViewController.identifier) as? ReportsViewController {
            return vcReportsViewController
        }
        return nil
    }
    
    func showVehicleBokingViewController() -> VehicleBokingViewController? {
        if let vcVehicleBokingViewController = Storyboard.VehicleBooking.instantiateViewController(with: VehicleBokingViewController.identifier) as? VehicleBokingViewController {
            return vcVehicleBokingViewController
        }
        return nil
    }
    
    func showUserProfileController() -> UserProfileViewController? {
        if let vcUserProfileViewController = Storyboard.ProfileSettings.instantiateViewController(with: UserProfileViewController.identifier) as? UserProfileViewController {
            return vcUserProfileViewController
        }
        return nil
    }
    
    func showMainTabBarController() -> MainTabViewController? {
        if let vcMainTabController = Storyboard.Main.instantiateViewController(with: MainTabViewController.identifier) as? MainTabViewController {
            return vcMainTabController
            //self.setRootViewController(vcMainTabController)
        }
        return nil
    }
    
    func showTripDetailsViewController() -> TripDetailsViewController? {
        if let vcTripDetailsViewController = Storyboard.Dashboard.instantiateViewController(with: TripDetailsViewController.identifier) as? TripDetailsViewController {
            return vcTripDetailsViewController
        }
        return nil
    }
    
    private func setRootViewController(_ viewController: UIViewController) {
        removePreviousViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        self.mainWindow?.rootViewController = nil
        self.mainWindow?.setRootViewController(navigationController, options: UIWindow.TransitionOptions(direction: .toRight))
        self.mainWindow?.makeKeyAndVisible()
    }
    
    private func removePreviousViewController() {
           let previousViewController = self.mainWindow?.rootViewController
           previousViewController?.dismiss(animated: true, completion: {
               previousViewController?.view.removeFromSuperview()
           })
       }
        
}
