//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

class PaymentForm: Observable {

    // Init
    let event: Event

    init(_ event: Event) {
        self.event = event
    }

    // Observable
    weak var observer: Observer?

    func notifyObserver() {
        observer?.observableDidUpdate(self)
    }

    // Properties
    var quantity: Int = 1 {
        didSet { notifyObserver() }
    }

    var email: String = "" {
        didSet { notifyObserver() }
    }

    var number: String = "" {
        didSet { notifyObserver() }
    }

    var expiry: NSDate! {
        didSet { notifyObserver() }
    }

    var cvc: String = "" {
        didSet { notifyObserver() }
    }
}