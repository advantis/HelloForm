//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

typealias EventListHandler = (Result<Event[]>) -> Void

extension Event {
    class func listEvents(handler: EventListHandler) -> Cancelable {
        let url = NSBundle.mainBundle().URLForResource("Event", withExtension: "json")
        let data = NSData(contentsOfURL: url)
        let json = JSON(data: data)
        let event = Event(attributes: json, context: EventParser())
        handler(Result.Success(Box([event])))
        return NetworkOperation()
    }
}