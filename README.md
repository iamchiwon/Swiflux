# Swiflux

[![CI Status](http://img.shields.io/travis/iamchiwon/Swiflux.svg?style=flat)](https://travis-ci.org/iamchiwon/Swiflux)
[![Version](https://img.shields.io/cocoapods/v/Swiflux.svg?style=flat)](http://cocoapods.org/pods/Swiflux)
[![License](https://img.shields.io/cocoapods/l/Swiflux.svg?style=flat)](http://cocoapods.org/pods/Swiflux)
[![Platform](https://img.shields.io/cocoapods/p/Swiflux.svg?style=flat)](http://cocoapods.org/pods/Swiflux)

## Intro

### What is Flux?
[Flux](https://facebook.github.io/flux/) is the application architecture that Facebook uses for building client-side web applications.

### Core of Flux
- Unidirectional flow
- View - Store - Action - Dispatcher

![](https://raw.githubusercontent.com/lgvalle/lgvalle.github.io/master/public/images/flux-graph-simple.png)

### Swiflux
Minimal library for swift that according to flux concept.

## Installation

Swiflux is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Swiflux"
```
**Requirements**
- RxSwift 3.x (or higher)
- Swift 3.x (or higher)

## Example

### Import library
```swift
import Swiflux
```

### Build Store class
1. extends StoreBase
```swift
class UserStore: StoreBase
```
2. Override some (optional)
```swift
override func buildDefaultState() {
}
override func bindEvents() {
}
```
3. Subscribe Action and change state
* state : a data that store has. changing of state will be broadcast to views who subscribe.
```swift
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
```

### Bind Store with View
```swift
let userStore = UserStore()

//bind state data via UserStore
userStore.on("greeting") { greet in
    let greet = greet as! String
    self.greetingLabel.text = greet
}
```

### Send Action events to Dispatcher
```swift
//Send Action Event
Dispatcher.shared().send("app:greeting", props: [
    "firstName": firstName as AnyObject,
    "lastName": lastName as AnyObject
])
```

#### Refer [Example source](./Example) code

## Author

Ryan Song&lt;iamchiwon@gmail.com&gt;

## License

Swiflux is available under the MIT license. See the LICENSE file for more info.
