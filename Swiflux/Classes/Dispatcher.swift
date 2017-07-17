//
//  Dispatcher.swift
//  Swiflux
//
//  Created by iamchiwon on 2017. 7. 17..
//  Copyright © 2017년 iamchiwon. All rights reserved.
//

import Foundation
import RxSwift

open class Dispatcher {
    /* INTERNAL ACTION STRUCT */
    struct SwifluxEvent {
        var action: String = ""
        var props: [String: AnyObject]? = nil
    }

    /* SINGLETONE */
    static let _dispatcher = Dispatcher()
    open static func shared() -> Dispatcher {
        return _dispatcher
    }

    private init() {
    }

    /* IMPLEMENTATION */
    var _disposeBag = DisposeBag()
    let _subject = PublishSubject<SwifluxEvent>()

    open func send(_ action: String, props: [String: AnyObject]? = nil) {
        let event = SwifluxEvent(action: action, props: props)
        _subject.onNext(event)
    }

    open func on(_ action: String, on: @escaping ([String: AnyObject]?) -> ()) {
        _subject.asObserver()
            .filter({ event in event.action == action })
            .subscribe(onNext: { event in on(event.props) })
            .disposed(by: _disposeBag)
    }

    open func reset() {
        _disposeBag = DisposeBag() //unsubscribe all
    }
}
