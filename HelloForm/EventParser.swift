//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

@objc
class EventParser: EventContext {
    @lazy var dateFormatter = NSDateFormatter(format: "yyyy-MM-dd'T'HH:mm:ss")
}