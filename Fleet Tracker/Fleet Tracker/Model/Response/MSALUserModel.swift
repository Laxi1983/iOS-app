//
//  MSALUserModel.swift
//  Fleet Tracker
//
//  Created by Sandip Mahajan on 06/12/19.
//  Copyright © 2019 Mobiliya. All rights reserved.
//

import UIKit
import HandyJSON

class MSALUserModel: HandyJSON {
    
    required init() {
        
    }
    
    var mail : String?
    var displayName: String?
    var password: String? = "default"
    var id: String?
    
    init (mail:String, displayName:String, password:String, id:String)
    {
        self.mail = mail
        self.displayName = displayName
        self.password = password
        self.id = id
    }

    
    
}

