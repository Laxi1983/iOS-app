//
//  PowerBIReportsInfoModel.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 03/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import HandyJSON
class PowerBIReportsInfoModel: HandyJSON {
 
   var AccessToken: String?
   var Report: ReportInfo?
   
   
    
    
    
required init() {
       
   }
}





class ReportInfo:HandyJSON
{
    var id: String?
    var name: String?
    var webUrl: String?
    var embedUrl: String?
    var datasetId: String?
    
    required init() {
        
    }
}
