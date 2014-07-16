//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

class NumericValidator: Validator {

    let validator = RegexValidator("^\\d*$")

    func validate(input: Any?, error: NSErrorPointer) -> Bool {
        return validator.validate(input, error: error)
    }
}