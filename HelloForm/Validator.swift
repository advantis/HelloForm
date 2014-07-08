//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

protocol Validator {
    // func validateWithError(error: NSErrorPointer) -> Bool
    func validate(input: Any?, error: NSErrorPointer) -> Bool
}