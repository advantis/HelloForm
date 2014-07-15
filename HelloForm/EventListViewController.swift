//
//  Copyright © 2014 Yuri Kotov
//

import UIKit

class EventListViewController: UITableViewController, EventContext {

    var events: Event[] = []
    @lazy var dateFormatter = NSDateFormatter(format: "yyyy-MM-dd'T'HH:mm:ss")

    func prepareForPurchase(destination: AnyObject!) {
        let indexPath = tableView.indexPathForSelectedRow()
        let presenter = destination as ViewController
        presenter.setEvent(events[indexPath.row], withContext:self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        switch segue.identifier! {
            case "buy":
                prepareForPurchase(segue.destinationViewController)
            default:
                super.prepareForSegue(segue, sender: sender)
        }
    }

    func loadEvents() {
        let url = NSBundle.mainBundle().URLForResource("Event", withExtension: "json")
        let data = NSData(contentsOfURL: url)
        let object : AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil)
        let json = JSON(object)
        let event = Event(attributes: json, context: self)
        events = [event]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadEvents()
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("EventListCell", forIndexPath: indexPath) as EventListCell
        cell.setEvent(events[indexPath.row], withContext:self)
        return cell
    }
}