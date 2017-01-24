//
//  ViewController.swift
//  RoomQuest
//
//  Created by Steven Tang  on 1/19/17.
//  Copyright © 2017 Steven Tang . All rights reserved.
//

import UIKit
import ArcGIS
/*
 *
 *  Commented code does not work
class ViewController: UIViewController, AGSMapViewLayerDelegate {
    
    @IBOutlet weak var mapView: AGSMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add a basemap tiled layer
        let url = NSURL(string: "http://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer")
        let tiledLayer = AGSTiledMapServiceLayer(URL: url)
        self.mapView.addMapLayer(tiledLayer, withName: "Basemap Tiled Layer")
        
        //2. Set the map view's layer delegate
        self.mapView.layerDelegate = self
    }
    
    //3. Implement the layer delegate method
    func mapViewDidLoad(mapView: AGSMapView!) {
        //do something now that the map is loaded
        //for example, show the current location on the map
        mapView.locationDisplay.startDataSource() 
    }
    
    
    
    
}
*/

class ViewController: UIViewController{

    @IBOutlet weak var mapView: AGSMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.map = AGSMap(basemapType: .imageryWithLabels, latitude: 34.180990,  longitude: -117.319976, levelOfDetail: 17)
       }
    func mapViewDidLoad(mapView: AGSMapView!) {
       // mapView.locationDisplay.startDataSource()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
