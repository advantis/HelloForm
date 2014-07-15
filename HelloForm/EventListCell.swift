//
//  Copyright © 2014 Yuri Kotov
//

import UIKit

class EventListCell: UITableViewCell {
}

extension EventListCell: EventPresenter {
    func setEvent(event: Event, withContext context: EventContext) {
        textLabel.text = event.name
        detailTextLabel.text = context.dateFormatter.stringFromDate(event.date)
    }
}