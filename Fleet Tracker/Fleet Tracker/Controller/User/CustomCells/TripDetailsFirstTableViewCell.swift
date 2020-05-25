//
//  TripDetailsFirstTableViewCell.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 05/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps
import MapKit


protocol TripDetailsFirstTableViewCellDelegate {
    func backButtonClicked()
}



class TripDetailsFirstTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var mapView: GMSMapView!
    
    
    @IBOutlet weak var vehicleNameLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!

    var tripDetailsFirstTableViewCellDelegate:TripDetailsFirstTableViewCellDelegate?
    var selectedTripLocation:[TripLocationModel] = []
    var speedLimit:Int = 40
    @IBAction func backButtonPressed(_ sender: Any) {
        
        tripDetailsFirstTableViewCellDelegate?.backButtonClicked()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           
         //  DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
    
            //self.plotRouteOnMap()
        //}
    }
    
    
    func plotRouteOnMap(){
        
        var points:[CLLocationCoordinate2D] = []
        var speedLimitPoints:[CLLocationCoordinate2D] = []
        mapView.clear()
 
        for i in 0 ..< selectedTripLocation.count
        {
          
            if Int(selectedTripLocation[i].Speed!) > speedLimit {
                speedLimitPoints.append(CLLocationCoordinate2D(latitude: selectedTripLocation[i].Latitude!, longitude: selectedTripLocation[i].Longitude!))
            }
            else{
            points.append(CLLocationCoordinate2D(latitude: selectedTripLocation[i].Latitude!, longitude: selectedTripLocation[i].Longitude!))
            }
            
        }
      let path1:GMSMutablePath = GoogleMapManager.shared.createGoogleMapRoots(points: points)
        let path2:GMSMutablePath = GoogleMapManager.shared.createGoogleMapRoots(points:speedLimitPoints )
        
        var bound =  GMSCoordinateBounds(path: path1)
        let polyline1 = GMSPolyline(path: path1)
        let polyline2 = GMSPolyline(path: path2)
        polyline1.strokeWidth = 5.0
        polyline2.strokeWidth = 5.0
       // polyline.strokeColor = UIColor(named: "MapRouteColor")!
        polyline1.geodesic = true
        polyline2.geodesic = true
        
        let styles1: [GMSStrokeStyle] = [.solidColor(UIColor(named: "MapRouteColor")!), .solidColor(.clear)]
               let styles2: [GMSStrokeStyle] = [.solidColor(UIColor.red), .solidColor(.clear)]
                  let scale = 1.0 / mapView.projection.points(forMeters: 1, at: mapView.camera.target)
                  let solidLine = NSNumber(value: 15.0 * Float(scale))
                  let gap = NSNumber(value: 10.0 * Float(scale))
                  polyline1.spans = GMSStyleSpans(path1, styles1, [solidLine, gap], GMSLengthKind.rhumb)
               polyline2.spans = GMSStyleSpans(path2, styles2, [solidLine, gap], GMSLengthKind.rhumb)
        
        
        polyline1.map = mapView
        polyline2.map = mapView
        
        let last = points.count-1
        
        let a1 = CLLocation(latitude: points[0].latitude, longitude: points[0].longitude )
        let a2 = CLLocation(latitude: points[last].latitude, longitude: points[last].longitude )
       let bearing:Double = GoogleMapManager.shared.getBearingBetweenTwoPoints(point1:a1 , point2: a2)
        
        let marker1:GMSMarker = GoogleMapManager.shared.createMarker(latitude: "\(points[0].latitude)", longitude: "\(points[0].longitude)", title:"Source", index: Int.random(in: 1 ... 3))
         
        let marker2:GMSMarker = GoogleMapManager.shared.createDestinationMarker(latitude: "\(points[last].latitude)", longitude: "\(points[last].longitude)", title:"Destination", index: Int.random(in: 1 ... 3))
        marker1.rotation = bearing
        var arr:[GMSMarker] = []
        arr.append(marker1)
        arr.append(marker2)
        for marker in arr{
            bound = bound.includingCoordinate(marker.position)
        }
        
        marker1.map = self.mapView
        marker2.map = self.mapView
        let update = GMSCameraUpdate.fit(bound, withPadding: 60)
               mapView.animate(with: update)
           
        
    }
    
    
    
    
}
