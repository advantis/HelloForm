//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

class RegexValidator: Validator {

    let predicate: NSPredicate
    var error = NSError(domain: "RegexValidatorDomain", code: 1, userInfo: nil)

    init (_ pattern: String) {
        predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
    }

    func validate(input: Any?, error: NSErrorPointer) -> Bool  {
        var isValid = false
        if let string = input as? String {
            isValid = predicate.evaluateWithObject(string)
        }
        if !isValid && error != nil {
            error.memory = self.error
        }
        return isValid
    }
}
