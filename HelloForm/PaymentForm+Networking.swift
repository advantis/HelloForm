//
//  PaymentForm+Networking.swift
//  HelloForm
//
//  Created by Yuri Kotov on 7/7/14.
//  Copyright (c) 2014 Yalantis. All rights reserved.
//

import Foundation

typealias ErrorHandler = (error: NSError?) -> Void

extension PaymentForm {

    func submitWithHandler(handler: ErrorHandler?) {
        handler?(error: NSError(domain: "PaymentFormErrorDomain", code: 1, userInfo: [
            NSLocalizedDescriptionKey : "Form submission is not implemented"
        ]))
    }
}