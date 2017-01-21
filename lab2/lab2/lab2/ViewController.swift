//
//  ViewController.swift
//  lab2
//
//  Created by Steven Tang  on 1/20/17.
//  Copyright © 2017 Steven Tang . All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputMessage: UILabel!
    @IBOutlet weak var userInput: UITextField!
    
    @IBAction func printButton(_ sender: Any) {
        outputMessage.text = userInput.text
        userInput.text = ""
        //Once user submits the text, it'll clear the text field
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

