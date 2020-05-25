//
//  LoginRequest.swift
//  Fleet Tracker
//
//  Created by Sandip Mahajan on 05/12/19.
//  Copyright © 2019 Mobiliya. All rights reserved.
//

import UIKit
import HandyJSON

class LoginRequest: HandyJSON {
    
    var userName : String?
    var name: String?
    var password: String?
    var oid: String?
    
    required init() {
        
    }
    
    // Mapped MSAL object the request object
    init(from msalUser : MSALUserModel) {
        userName = msalUser.mail
        name = msalUser.displayName
        password = msalUser.password
        oid = msalUser.id
    }
}
