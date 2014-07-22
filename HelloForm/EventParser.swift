//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

@objc
class EventParser: EventContext {
    @lazy var dateFormatter = NSDateFormatter(format: "yyyy-MM-dd'T'HH:mm:ss")
}

extension EventParser: ResponseSerialization {
    func objectForResponse(response: NSURLResponse, data: NSData, error: NSErrorPointer) -> [Event] {
        let json = JSON(data: data)
        var events: [Event] = []
        for event in json {
            events.append(Event(attributes: event, context: self))
        }
        return events
    }
}