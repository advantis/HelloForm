//
//  Copyright © 2014 Yuri Kotov
//

import UIKit

class EventListViewController: UITableViewController {

    func prepareForPurchase(destination: EventPresenter) {
        let event = Event(id:1)
        event.quantity = 4
        destination.setEvent(event)
    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        switch segue.identifier! {
            case "buy":
                prepareForPurchase(segue.destinationViewController as EventPresenter)
            default:
                super.prepareForSegue(segue, sender: sender)
        }
    }
}