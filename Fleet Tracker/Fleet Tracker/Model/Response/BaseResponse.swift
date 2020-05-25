//
//  BaseResponse.swift
//  Fleet Tracker
//
//  Created by Sandip Mahajan on 05/12/19.
//  Copyright © 2019 Mobiliya. All rights reserved.
//

import UIKit
import HandyJSON

class BaseResponse: HandyJSON {

    var status:Int?
       var total:Int?
       var filtered:Int?
       var message:String?
    required init() {
        
    }
}
