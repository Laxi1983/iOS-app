//
//  GoogleMapManager.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 28/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import Foundation
import GoogleMaps
class GoogleMapManager: NSObject
{
    public static let shared = GoogleMapManager()
    let googleMapAPIKey:String = ""
    var FinalpolyLineString:String?
    
    
    
    func createGoogleMapRoots(points:[CLLocationCoordinate2D]) ->  GMSMutablePath
    {
        let path = GMSMutablePath()
        for index in 0 ..< points.count
        {
            path.addLatitude(points[index].latitude, longitude:points[index].longitude)
        }
        
        
        return path
    }
    
    
    
    
    func createMarker(latitude:String, longitude:String, title:String, index:Int) -> GMSMarker
    {
        let marker = GMSMarker()
        marker.tracksViewChanges = false
        let markerImage = UIImage(named: "CarMarkerImage\(index)")
        let markerView = UIImageView(image: markerImage)
        marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude)!, longitude: CLLocationDegrees(longitude)!)
        marker.iconView = markerView
        // marker.icon = UIImage(contentsOfFile: "Marker1")
        marker.appearAnimation = GMSMarkerAnimation.pop
        marker.title = title
        //marker.snippet = "India"
        return marker
    }
    
  
    
    func createDestinationMarker(latitude:String, longitude:String, title:String, index:Int) -> GMSMarker
    {
        let marker = GMSMarker()
        marker.tracksViewChanges = false
        let markerImage = UIImage(named: "PlainRedMarkerImage")
        let markerView = UIImageView(image: markerImage)
        marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude)!, longitude: CLLocationDegrees(longitude)!)
        marker.iconView = markerView
        // marker.icon = UIImage(contentsOfFile: "Marker1")
        marker.appearAnimation = GMSMarkerAnimation.pop
        marker.title = title
        //marker.snippet = "India"
        return marker
    }
    
    
    
    func XXRadiansToDegrees(radians: Double) -> Double {
        return radians * 180.0 / M_PI
    }

    func getBearingBetweenTwoPoints(point1 : CLLocation, point2 : CLLocation) -> Double {
        // Returns a float with the angle between the two points
        let x = point1.coordinate.longitude - point2.coordinate.longitude
        let y = point1.coordinate.latitude - point2.coordinate.latitude

        return fmod(XXRadiansToDegrees(radians: atan2(y, x)), 360.0) + 90.0
    }
    
    
}
