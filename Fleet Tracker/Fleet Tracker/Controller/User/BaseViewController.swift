//
//  BaseViewController.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 12/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
     public static let shared = BaseViewController()
    //static let appDelegate = UIApplication.shared.delegate as! AppDelegate
      static private var activityindicater:UIActivityIndicatorView!
      static private var activityindicaterView:UIView! = nil
     static var indicator = false
   let screenRect = UIScreen.main.bounds
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    func showAlertMessage(message : String)-> UIAlertController{
        
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        //self.present(alert, animated: true, completion: nil)
        
        return alert
    }
    
    
    // MARK: - Activity indicator
    static private func initializeIndicator(){
        self.activityindicaterView = UIView.init(frame: CGRect(x: 0, y: 0, width: ((SceneDelegate.shared! as AnyObject).window!.frame.size.width), height: ((SceneDelegate.shared! as AnyObject).window!.frame.size.height)))
            
    self.activityindicaterView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
    self.activityindicater = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        self.activityindicater.center = ((SceneDelegate.shared!.window?.center)!)
    self.activityindicaterView.addSubview(self.activityindicater)
    }

    //: Add Activity indicator in view controller
    static func addActivitiIndicaterView() {
    print("add indicator")
    DispatchQueue.main.async {
    if !indicator {
    if (self.activityindicater == nil)
    {
    initializeIndicator()
    }
    self.activityindicaterView.addSubview(self.activityindicater)
    self.activityindicaterView.isHidden = false
    SceneDelegate.shared!.window?.addSubview(self.activityindicaterView)
    self.activityindicater.startAnimating()
    self.indicator = true
    }
    }

    }

    // : - Add Activity indicator in view controller
    static func hideActivitiIndicaterView() {
    print("hide indicator")
    DispatchQueue.main.async {
    if (self.activityindicater != nil){
    self.activityindicater.stopAnimating()
    self.activityindicaterView.removeFromSuperview()
    self.activityindicaterView.isHidden = true
    self.indicator = false
    }
    }
    }
    
    
    
    
}
