//
//  HomeFirstTableviewCell.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 29/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps
class HomeFirstTableviewCell: UITableViewCell {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    var bound = GMSCoordinateBounds()
    // var locationManager = CLLocationManager()
    var VehiclesArray:[VehicleData] = []
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            self.plotMarkerOnGoogleMap()
            print(" plotMarkerOnGoogleMap VehiclesArray \(self.VehiclesArray.toJSON())")
            // self.locationManager.delegate = self
            // self.locationManager.startUpdatingLocation()
        }
        
    }
    
    
    func plotMarkerOnGoogleMap()
    {
        var arr:[GMSMarker] = []
        
        for vehicle in VehiclesArray
        {
            print("in plotMarkerOnGoogleMap vehicle \(vehicle.toJSON())")
            
            
            let marker:GMSMarker = GoogleMapManager.shared.createMarker(latitude: vehicle.Latitude!, longitude: vehicle.Longitude!, title:vehicle.VehicleName!, index: Int.random(in: 1 ... 3))
            
            arr.append(marker)
           
            
            
            bound = bound.includingCoordinate(marker.position)
            marker.map = self.mapView
            
            
            
            
        }
        
        for marker in arr{
            bound = bound.includingCoordinate(marker.position)
        }
        
        let update = GMSCameraUpdate.fit(bound, withPadding: 60)
        mapView.animate(with: update)
    
        
    }
    
    
}


// implementation of MyCurrentLocation

//extension HomeFirstTableviewCell:CLLocationManagerDelegate
//{
//
//    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//
//        let location = locations.last
//
//        let zoomCamera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)
//
//        self.mapView?.animate(to: zoomCamera)
//        self.locationManager.stopUpdatingLocation()
//
//    }
//}
