//
//  myViewController.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 27/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import UIKit
import iCarousel
class WelcomeScreenViewController: UIViewController {
    
    
    
    @IBOutlet weak var carousel: iCarousel!
    var gradientLayer: CAGradientLayer!
    var arr:[UIImage] = []
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // createGradientLayer()
        print("in viewDidLoad ")
        
        arr.append(UIImage(named: "Image1")!)
        arr.append(UIImage(named: "Image1")!)
        arr.append(UIImage(named: "Image1")!)
        arr.append(UIImage(named: "Image1")!)
        arr.append(UIImage(named: "Image1")!)
        arr.append(UIImage(named: "Image1")!)
        
        carousel.type = .linear
        carousel.contentMode = .scaleAspectFill
        carousel.reloadData()
        carousel.dataSource = self
        carousel.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("in viewWillAppear ")
        createGradientLayer()
    }
    
    
    
    
    
    
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.colors = [UIColor.hexStringToUIColor(hex: "#56CCF2", alpha: 1.0).cgColor, UIColor.hexStringToUIColor(hex: "#3497FD", alpha: 1.0).cgColor]
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
}

extension WelcomeScreenViewController: iCarouselDelegate
{
    
    //    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
    //        switch (option) {
    //        case .spacing: return 8
    //            default: return value
    //        }
    //    }
}
extension WelcomeScreenViewController: iCarouselDataSource
{
    func numberOfItems(in carousel: iCarousel) -> Int {
        return arr.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let tempview = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
        let frame = CGRect(x: 0, y: 0, width: 400, height: 300)
        let imageview = UIImageView()
        imageview.frame = frame
        imageview.contentMode = .scaleAspectFit
        imageview.image = arr[index]
        tempview.addSubview(imageview)
        return tempview
    }
}
