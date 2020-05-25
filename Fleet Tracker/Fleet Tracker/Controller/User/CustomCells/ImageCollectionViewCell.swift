//
//  ImageCollectionViewCell.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 04/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import UIKit
class ImageCollectionViewCell:UICollectionViewCell
{
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            self.pageControl.transform = CGAffineTransform(scaleX: 1, y: 1)
//
//        }
        
    }
    
    
}
