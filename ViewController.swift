//
//  ViewController.swift
//  RoomQuest_v3
//
//  Created by Steven Tang  on 1/26/17.
//  Copyright © 2017 Steven Tang . All rights reserved.
/// Map ID: d5ef78cbe5f64454a15cc967db011635
// Map Link: http://www.arcgis.com/home/webmap/viewer.html?webmap=d5ef78cbe5f64454a15cc967db011635
// Need to do device location
import UIKit
import ArcGIS
import CoreLocation



class ViewController: UIViewController{
    
    var map:AGSMap!
    var portal:AGSPortal!
    let url = "http://www.arcgis.com/home/webmap/viewer.html?webmap=d5ef78cbe5f64454a15cc967db011635"
    @IBOutlet weak var mapView: AGSMapView!
    
    @IBAction func location_btn(_ sender: Any) {
        self.startLocationDisplay(autoPanMode: AGSLocationDisplayAutoPanMode.recenter)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.portal = AGSPortal(url: NSURL(string: "http://www.arcgis.com")! as URL, loginRequired: false)
        self.map = AGSMap(url: NSURL(string: url)! as URL)
        self.mapView.map = self.map
        
        /*        self.mapView.locationDisplay.start{ (error:Error?) -> Void in
         if let error = error {
         //UIAlertView(title: "Error", message: error.localizedDescription, delegate: nil, cancelButtonTitle: "Ok").show()
         UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .actionSheet)
         }
         else {
         print("Location Display Started")
         }
         }
         */
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func startLocationDisplay(autoPanMode:AGSLocationDisplayAutoPanMode) {
        self.mapView.locationDisplay.autoPanMode = autoPanMode
        self.mapView.locationDisplay.start { (error:Error?) -> Void in
            if let error = error {
                UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .actionSheet)
            }
        }
    }
}
