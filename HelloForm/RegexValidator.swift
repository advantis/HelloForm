//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

class RegexValidator: Validator {

    let predicate: NSPredicate

    init (_ pattern: String) {
        predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
    }

    func validate(input: Any?, error: NSErrorPointer) -> Bool  {
        var isValid = false
        if let string = input as? String {
            isValid = predicate.evaluateWithObject(string)
        }
        if !isValid && error {
            error.memory = NSError(domain: "RegexpValidatorDomain", code: 1, userInfo: nil)
        }
        return isValid
    }
}
