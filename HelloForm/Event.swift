//
//  Copyright © 2014 Yuri Kotov
//

import Foundation

@objc
class Event {
    
    let id: Int
    let name: String
    let date: NSDate
    let price: Double
    let quantity: Int

    init(attributes: JSON, context: EventContext) {
        id = attributes["id"].intValue()!
        name = attributes["name"].stringValue()!
        price = attributes["price"].doubleValue()!
        quantity = attributes["quantity"].intValue()!
        date = context.dateFormatter.dateFromString(attributes["date"].stringValue()!)!
    }
}
