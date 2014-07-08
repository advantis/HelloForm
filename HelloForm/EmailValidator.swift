//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

class EmailValidator: Validator {
    
    let validator = RegexValidator(".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*")

    func validate(input: Any?, error: NSErrorPointer) -> Bool {
        return validator.validate(input, error: error)
    }
}