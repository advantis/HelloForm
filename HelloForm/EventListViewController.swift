//
//  Copyright © 2014 Yuri Kotov
//

import UIKit

class EventListViewController: UITableViewController, EventContext {

    var events: Event[] = []
    weak var request: Cancelable?

    @lazy
    var dateFormatter = NSDateFormatter(format: "dd/MM/yy")

    func reloadData() {
        request?.cancel()
        // TODO: Replace 'weak' with 'unowned' when it stop crashing
        request = Event.listEvents({[weak self] result in
            switch result {
                case .Success(let events):
                    self!.events = events
                    self!.tableView.reloadData()
                    self!.refreshControl?.endRefreshing()
                case .Failure(let error):
                    println(error)
            }
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()

        // TODO: Set this in Interface Builder when possible
        refreshControl.addTarget(self, action: "reloadData", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    // TODO: Extract into generic data source
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("EventListCell", forIndexPath: indexPath) as EventListCell
        cell.setEvent(events[indexPath.row], withContext:self)
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        switch segue.identifier! {
            case "buy":
                prepareForPurchase(segue.destinationViewController)
            default:
                super.prepareForSegue(segue, sender: sender)
        }
    }

    func prepareForPurchase(destination: AnyObject!) {
        let indexPath = tableView.indexPathForSelectedRow()
        let presenter = destination as EventPresenter
        presenter.setEvent(events[indexPath.row], withContext:self)
    }
}