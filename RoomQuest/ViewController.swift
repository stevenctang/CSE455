//
//  ViewController.swift
//  RoomQuest_v2
//
//  Created by Steven Tang  on 1/23/17.
//  Copyright © 2017 Steven Tang . All rights reserved.
//
// Map ID: d5ef78cbe5f64454a15cc967db011635
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

    override func viewDidLoad() {
       
        self.portal = AGSPortal(url: NSURL(string: "http://www.arcgis.com")! as URL, loginRequired: false)

        super.viewDidLoad()
        self.map = AGSMap(url: NSURL(string: url)! as URL)
        self.mapView.map = self.map
      
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

