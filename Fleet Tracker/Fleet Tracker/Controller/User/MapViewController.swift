//
//  MapViewController.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 20/04/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
class MapViewController: UIViewController {
    
    let src = "19.0759837,72.8776559"
    let source = CLLocationCoordinate2D(latitude: 19.0759837, longitude: 72.8776559)
    let dest = "18.5204303,73.8567437"
    let destination = CLLocationCoordinate2D(latitude: 18.5204303, longitude: 73.8567437)
    
    @IBOutlet weak var gmsMapView: GMSMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("&&&")
        
        
        
    }
    
    
    
    @IBAction func onClickRoutesButton(_ sender: Any) {
        
        self.plotRoutesOnGoogleMap()
        
        
        
    }
    
    
    func plotRoutesOnGoogleMap()
    {
        
           let url = URL(string:"https://maps.googleapis.com/maps/api/directions/json?origin=19.0759837,72.8776559&destination=18.5204303,73.8567437&sensor=false&mode=driving&key=AIzaSyBv-5peE4y8xAsDSsQHIgx-TP7sRu7n9-w")
        
       // let url = URL(string:"https://maps.googleapis.com/maps/api/directions/json?origin=19.0759837,72.8776559&destination=18.5204303,73.8567437&sensor=false&mode=driving")
        
        
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            
            print("###Data :: \(data)")
            print("###response :: \(response)")
            print("###error :: \(error)")
            let string1 = String(data: data!, encoding: String.Encoding.utf8) ?? "Data could not be printed"
            print("### String1 = \(string1)")
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard let jsonResult = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] else {
                
                print("error in JSONSerialization")
                return
                
            }
            
            
            
            guard let routes = jsonResult["routes"] as? [Any] else {
                return
            }
            print("Routes :: \(routes)")
            guard let route = routes[0] as? [String: Any] else {
                return
            }
            
            guard let legs = route["legs"] as? [Any] else {
                return
            }
            
            guard let leg = legs[0] as? [String: Any] else {
                return
            }
            
            guard let steps = leg["steps"] as? [Any] else {
                return
            }
            for item in steps {
                
                guard let step = item as? [String: Any] else {
                    return
                }
                
                guard let polyline = step["polyline"] as? [String: Any] else {
                    return
                }
                
                guard let polyLineString = polyline["points"] as? String else {
                    return
                }
                
                DispatchQueue.main.async {
                    self.drawPath(from: polyLineString)
                }
                
            }
        }).resume()
    }
    
    
    
    func drawPath(from polyStr: String){
        let path = GMSPath(fromEncodedPath: polyStr)
        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 3.0
        polyline.map = gmsMapView
        
        let cameraUpdate = GMSCameraUpdate.fit(GMSCoordinateBounds(coordinate: source, coordinate: destination))
        gmsMapView.moveCamera(cameraUpdate)
        let currentZoom = gmsMapView.camera.zoom
        gmsMapView.animate(toZoom: currentZoom - 1.4)
    }
}
