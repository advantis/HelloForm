//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

typealias ErrorHandler = (Result<Void>) -> Void

extension PaymentForm {

    func submitWithHandler(handler: ErrorHandler?) {
        let error = NSError(domain: "PaymentFormErrorDomain", code: 1, userInfo: [
            NSLocalizedDescriptionKey : "Form submission is not implemented"
        ])
        handler?(Result.Failure(error))
    }
}