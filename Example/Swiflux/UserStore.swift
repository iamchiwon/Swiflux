//
//  UserStore.swift
//  Swiflux
//
//  Created by iamchiwon on 2017. 7. 17..
//  Copyright © 2017년 CocoaPods. All rights reserved.
//

import Foundation
import Swiflux

class UserStore: StoreBase {

    override func buildDefaultState() {
        //default state value
        setState(for: "greeting", state: "")
    }

    override func bindEvents() {

        //subscribe action event "app:greeting"
        Dispatcher.shared().on("app:greeting") { props in
            guard let props = props else { return }

            let firstName = props["firstName"] as! String
            let lastName = props["lastName"] as! String

            self.buildGreetMessage(first: firstName, last: lastName)
        }
    }

    //BUISINESS LOGIC
    func buildGreetMessage(first: String, last: String) {
        var greet = "Hi~ there!"
        
        if first.isEmpty && !last.isEmpty {
            greet = "Hello, \(last)."
        } else if !first.isEmpty && last.isEmpty {
            greet = "Hi, \(first)."
        } else if !first.isEmpty && !last.isEmpty {
            greet = "Hello, \(first) \(last)!"
        }
        
        //change state, and notify to View
        self.setState(for: "greeting", state: greet)
    }
}
