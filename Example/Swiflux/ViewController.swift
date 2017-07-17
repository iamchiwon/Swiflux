//
//  ViewController.swift
//  Swiflux
//
//  Created by iamchiwon on 07/17/2017.
//  Copyright (c) 2017 iamchiwon. All rights reserved.
//

import UIKit
import Swiflux

class ViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var greetingLabel: UILabel!

    let userStore = UserStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //bind state data via UserStore
        userStore.on("greeting") { greet in
            let greet = greet as! String
            self.greetingLabel.text = greet
        }
    }

    @IBAction func onHello(_ sender: Any) {
        let firstName = firstNameField.text!
        let lastName = lastNameField.text!
        
        //Send Action Event
        Dispatcher.shared().send("app:greeting", props: [
            "firstName": firstName as AnyObject,
            "lastName": lastName as AnyObject
        ])
        
        //dissmiss keyboard
        self.view.endEditing(true)
    }
}

