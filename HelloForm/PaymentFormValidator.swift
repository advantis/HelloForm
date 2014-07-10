//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

@objc // Currently crashes using @class_protocol
protocol PaymentFormValidatorDelegate {
    func didValidateCvcWithError(error: NSError?)
    func didValidateEmailWithError(error: NSError?)
    func didValidateNumberWithError(error: NSError?)
    func didValidateExpiryWithError(error: NSError?)
}

class PaymentFormValidator: Validator {

    let emailValidator = EmailValidator()
    let expiryValidator = ExpiryValidator()
    let numberValidator = CardNumberValidator()
    let cvcValidator = CardCvcValidator()

    weak var delegate: PaymentFormValidatorDelegate?

    var error = NSError(domain: "PaymentFormValidatorDomain", code: 1, userInfo: nil)

    convenience init(delegate: PaymentFormValidatorDelegate) {
        self.init()
        self.delegate = delegate
    }

    func validate(input: Any?, error: NSErrorPointer) -> Bool  {
        var isValid = false
        if let form = input as? PaymentForm {
            isValid = true
            var error: NSError?

            error = nil
            isValid &= emailValidator.validate(form.email, error: &error)
            delegate?.didValidateEmailWithError(error)

            error = nil
            isValid &= expiryValidator.validate(form.expiry, error: &error)
            delegate?.didValidateExpiryWithError(error)

            error = nil
            isValid &= numberValidator.validate(form.number, error: &error)
            delegate?.didValidateNumberWithError(error)

            error = nil
            let info = (form.number, form.cvc) // Currently crashes when passed inline
            isValid &= cvcValidator.validate(info, error: &error)
            delegate?.didValidateCvcWithError(error)
        }
        if !isValid && error {
            error.memory = self.error
        }
        return isValid
    }
}