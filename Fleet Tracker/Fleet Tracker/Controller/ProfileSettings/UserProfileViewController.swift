//
//  UserProfileViewController.swift
//  Fleet Tracker
//
//  Created by Nandini Mane on 22/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import UIKit

class UserProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
