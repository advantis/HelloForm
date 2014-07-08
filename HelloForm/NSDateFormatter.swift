//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

extension NSDateFormatter {
    convenience init(format: String) {
        self.init()
        self.dateFormat = format
    }
}