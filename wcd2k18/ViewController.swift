//
//  ViewController.swift
//  wcd2k18
//
//  Created by Mart Lumeste on 11/12/2016.
//  Copyright © 2016 Mart Lumeste. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    //Map
    @IBOutlet weak var map: MKMapView!
    @IBAction func button(_ sender: Any) {
        fetchTrashPoints()
    }
    var trashPoints: [TrashPointModel]? = []

    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        map.setRegion(region, animated: true)
        
        print(location.altitude)
        print(location.speed)
    
        
        self.map.showsUserLocation = true

    }
    
    func fetchTrashPoints() {
        let url = URL(string:"https://wcd.herokuapp.com/trashpoint/all")!
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) {
            (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            self.trashPoints = [TrashPointModel]()
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                
                if let json = json as? [String: AnyObject] {
                    
                
                        if  let name = json["name"] as? String,
                            let trashAmount = json["trashAmount"] as? String,
                            let trashType = json["trashType"] as? String,
                            let formattedAddress = json["formattedAddress"] as? String,
                            let postalCode = json["postalCode"] as? Int,
                            let locationLatitude = json["locationLatitude"] as? Float,
                            let locationLongitude = json["locationLongitude"] as? Float {
                    
                                let trashPoints = TrashPointModel(name: name, trashType: trashType, trashAmount: trashAmount, formattedAddress: formattedAddress, postalCode: postalCode, locationLatitude: locationLatitude, locationLongitude: locationLongitude)
                    
                        }
                    }
                
                DispatchQueue.main.async {
                   
                   
                }
                
            } catch let error {
                print(error)
                }
            
        }
       task.resume()
    }
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}


