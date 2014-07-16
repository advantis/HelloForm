//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

class ExpiryInputFilter: Validator {
    
    let validator = RegexValidator("^((\\d{0,2})|(\\d{2}/\\d{0,4}))$")

    func validate(input: Any?, error: NSErrorPointer) -> Bool {
        return validator.validate(input, error: error)
    }
}