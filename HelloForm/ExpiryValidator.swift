//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

class ExpiryValidator: Validator {

    var error = NSError(domain: "ExpiryValidatorDomain", code: 1, userInfo: nil)

    func validate(input: Any?, error: NSErrorPointer) -> Bool {
        var isValid = false
        if let date = input as? NSDate {
            isValid = (NSComparisonResult.OrderedAscending == NSDate.date().compare(date))
        }
        if !isValid && error != nil {
            error.memory = self.error
        }
        return isValid
    }
}