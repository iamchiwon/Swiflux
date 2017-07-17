//
//  StoreBase.swift
//  Swiflux
//
//  Created by iamchiwon on 2017. 7. 17..
//  Copyright © 2017년 iamchiwon. All rights reserved.
//

import Foundation
import RxSwift

open class StoreBase {
    let _disposeBag = DisposeBag()
    var _states = [String: AnyObject]()
    let _subject = PublishSubject<[String: AnyObject]>()
    
    open func state(for key:String) -> AnyObject {
        if let state = _states[key] {
            return state
        }
        return "" as AnyObject
    }
    
    open func stringState(for key:String) -> String {
        return state(for:key) as! String
    }
    
    open func boolState(for key:String) -> Bool {
        if let state = state(for:key) as? Bool {
            return state
        }
        return false
    }
    
    open func intState(for key:String) -> Int {
        if let state = state(for:key) as? Int {
            return state
        }
        return 0
    }
    
    open func floatState(for key:String) -> Float {
        if let state = state(for:key) as? Float {
            return state
        }
        return 0
    }

    open func setState(for key: String, state: AnyObject) {
        _states[key] = state
        //TODO: distinct until changed
        _subject.onNext(_states)
    }
    
    open func setState(for key: String, state: String) {
        setState(for:key, state:state as AnyObject)
    }
    
    open func setState(for key: String, state: Bool) {
        setState(for:key, state:state as AnyObject)
    }
    
    open func setState(for key: String, state: Int) {
        setState(for:key, state:state as AnyObject)
    }
    
    open func setState(for key: String, state: Float) {
        setState(for:key, state:state as AnyObject)
    }

    open func on(_ key: String, state: @escaping (AnyObject) -> ()) {
        _subject.asObserver()
            .map({ states in states[key]! })
            .subscribe(onNext:{ state($0) })
            .disposed(by: _disposeBag)
    }
    
    public init() {
        buildDefaultState()
        bindEvents()
    }
    
    //should override
    open func buildDefaultState() {
    }
    
    //should override
    open func bindEvents() {
        
    }
}
