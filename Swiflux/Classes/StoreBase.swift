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

    open func setState(for key: String, state: AnyObject) {
        _states[key] = state
        //TODO: distinct until changed
        _subject.onNext(_states)
    }
    
    open func setState(for key: String, state: String) {
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
