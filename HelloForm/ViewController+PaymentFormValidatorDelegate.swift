//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

extension ViewController: PaymentFormValidatorDelegate {
    
    func didValidateCvcWithError(error: NSError?) {
        cvcField.setError(error)
    }

    func didValidateEmailWithError(error: NSError?) {
        emailField.setError(error)
    }

    func didValidateNumberWithError(error: NSError?) {
        numberField.setError(error)
    }

    func didValidateExpiryWithError(error: NSError?) {
        expiryField.setError(error)
    }
}
