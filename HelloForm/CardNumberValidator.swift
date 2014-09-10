//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

class CardNumberValidator: Validator {

    var error = NSError(domain: "CardNumberValidatorDomain", code: 1, userInfo: nil)

    func isLengthValid(number: String) -> Bool {
        let length = countElements(number)
        return 10 <= length && length < 20
    }

    func isLuhnValid(number: String) -> Bool {
        let asciiOffset: UInt8 = 48
        let digits = Array(number.utf8).reverse().map{$0 - asciiOffset}

        let convert: (UInt8) -> (UInt8) = {
            let n = $0 * 2
            return n > 9 ? n - 9 : n
        }

        var sum: UInt8 = 0
        for (index, digit) in enumerate(digits) {
            if index & 1 == 1 {
                sum += convert(digit)
            } else {
                sum += digit
            }
        }
        return sum % 10 == 0
    }

    func normalize(number: String) -> String {
        return join("", split(number, {$0 == " " || $0 == "-"}))
    }

    func validate(input: Any?, error: NSErrorPointer) -> Bool {
        var isValid = false
        if var number = input as? String {
            number = normalize(number)
            isValid = isLengthValid(number) && isLuhnValid(number)
        }
        if !isValid && error != nil {
            error.memory = self.error
        }
        return isValid
    }
}