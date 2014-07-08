//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

class ExpiryValidator: Validator {

    func validate(input: Any?, error: NSErrorPointer) -> Bool {
        var isValid = false
        if let date = input as? NSDate {
            isValid = (NSComparisonResult.OrderedAscending == NSDate.date().compare(date))
        }
        if !isValid && error {
            error.memory = NSError(domain: "ExpiryValidatorDomain", code: 1, userInfo: nil)
        }
        return isValid
    }
}