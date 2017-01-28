//
//  ViewController.swift
//  lab3
//
//  Created by Steven Tang  on 1/26/17.
//  Copyright © 2017 Steven Tang . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var output: UITextView!
    @IBOutlet weak var input: UITextField!
    @IBAction func tapButton(_ sender: Any) {
        
        /*
         when the user taps on the button, i’m going to collect the value from the input
         field and pass it to my function called ‘getString’
         */
        getString(length: input.text!) { (result) in  // execute on results within a custom closure
            getString(
            /*
             If i need to continue to manipulate my results it’s recommended you do so
             within the getString function, however you can place some conditionals
             and loops here, and do other manipulations prior to passing the results to
             the main queue.
             */
            
            DispatchQueue.main.async(execute: {
                /*
                 The GUI only exists on the main thread, so the only way to update it is by Dispatching the main Queue. Attempting to update the UI from any other thread will cause the app to behave badly and in most cases it will just crash.
                 */
                
                self.output.text = result // update the output view to match my results.
            })
        }
    }
    
    
    
    
    /*
     This is my asynchronous function that will run on a background thread. I will call
     this function from the main thread, and pass the results to an escaping function, which will allow me to handle the results within a custom closure (see above)
     */
    func getString(var1: String, var2: Int, var3: Bool, var4: String, completion: @escaping (_ result: String)->Void) -> Void {
        
        //first I need to indicate the URL i’m making my requests to.
        let myURL = URL(string: "https://mobileapps.dev.csusb.edu/0f04d4f85256be4d74baf393507dd6a3/string2.php")
        
        //Now I need to generate a new HTTP request for the URL
        var request = URLRequest(url: myURL!)
        
        //Set the request method - in my example I used POST, other options
        //are GET, PUT, DELETE
        request.httpMethod = "POST"
        
        /*
         Next we need to set the body of our HTTP Request. Note POST, PUT,
         DELETE can pass params through the HTTP Body. However, this particular
         way of doing it is considered ‘odd’. In most cases you would want to
         construct this the same way you would a GET request and pass params in
         the URI, as this is considered more RESTful.
         */
        let postString = "thing1=\(var1)&thing2=\(var2)&thing3=\(var3)&thing4=\(var4)"
       	request.httpBody = postString.data(using: String.Encoding.utf8)
        
        
        /*
         task is the meat of our function call, we’re going to declare a new session
         pass our request, and create another completion to handle the response
         from the Server.
         */
        let task = URLSession.shared.dataTask(with: request, completionHandler: {
            data, response, error in
            //data = data sent back from the server
            //response = HTTP response sent back from server
            //error = any errors sent back from server
            
            if error != nil {
                print("error \(error)")
                Return
                /*
                 the first thing I want to call is my error handler, if there is an error in
                 my request, I need to deal with it right away before I continue to
                 manipulate the data. In this case I am just printing the error to my
                 console and returning from the function, without retrieving the
                 requested data. Depending on the error you may want to take
                 different actions. One common error that you come up on is no
                 internet connection. If you get this error but forget to exit from the
                 function when its received, proceeding to execute the code below
                 will cause your app to crash
                 */
            }
            
            /*
             Since i’m not using the response code for anything in this example i’m overloading the variable. You may want to pick a different variable name for best practice, but i’m being lazy.
             In this example i’m going to attempt to unpack the data (read about optionals if
             you’re unfamiliar.) into the variable called response.
             */
            if let response = NSString(data: data!, encoding: String.Encoding.utf8.rawValue){
                /*
                 if i am able to unpack the data, I’ll pass it as a string back to my completion
                 function which is executed as a closure in the code above.
                 */
                completion(response as String)
            } else {
                /*
                 if I am unable to unpack the data, this means the data returned from the 
                 server contained ‘null’. If I was expecting some kind of data in return, then I 
                 should treat this event as an error.
                 */
                completion("some error occured")
            }
            
        })
        /* 
         after defining my task I need to runing. task.resume() will run my task in the 
         background, and continue to run it until the completion function is called.
         */
        task.resume()
    }


}

