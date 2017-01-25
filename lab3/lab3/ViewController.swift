//
//  ViewController.swift
//  lab3
//
//  Created by Steven Tang  on 1/23/17.
//  Copyright © 2017 Steven Tang . All rights reserved.
//

import UIKit
import SwiftyJSON
class ViewController: UIViewController {

    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var userInput: UITextField!
    @IBAction func get_btn(_ sender: Any) {
        
    }
    func parseJSON(){
        let path : String = NSBundle.mainBundle().pathForResource("http://date.jsontest.com", ofType: "json") as URL!
        let jsonData = NSData(contentsOfURL : path) as NSData!
        let readableJSON = JSON(data)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

