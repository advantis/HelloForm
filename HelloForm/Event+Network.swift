//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

typealias EventListHandler = (Result<Event[]>) -> Void

extension Event {
    class func listEvents(handler: EventListHandler) -> Cancelable {
        let request = NetworkOperation<Event[]>() {
            return NSData(contentsOfURL: NSBundle.mainBundle().URLForResource("EventList", withExtension: "json"))
        }
        request.parser = EventParser()
        request.completion = {events in
            handler(Result.Success(Box(events)))
        }
        request.start()
        return request
    }
}