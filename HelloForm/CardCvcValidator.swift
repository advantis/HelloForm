//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

typealias CreditCardInfo = (number: String, cvc: String)

class CardCvcValidator: Validator {

    var error = NSError(domain: "CardCvcValidatorDomain", code: 1, userInfo: nil)

    func validate(input: Any?, error: NSErrorPointer) -> Bool {
        var isValid = false
        if let (number, cvc) = input as? CreditCardInfo {
            let length = countElements(cvc)
            let isAmex = number.hasPrefix("34") || number.hasPrefix("37")
            isValid = (isAmex && length == 4) || (!isAmex && length == 3)
        }
        if !isValid && error != nil {
            error.memory = self.error
        }
        return isValid
    }
}