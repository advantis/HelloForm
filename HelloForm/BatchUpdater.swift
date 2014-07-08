//
//  Copyright © 2014 Yuri Kotov
//

class BatchUpdater {
    let observable: Observable

    init (_ obs: Observable) {
        observable = obs
    }

    func update(batch: () -> Void) {
        let observer = observable.observer
        observable.observer = nil
        batch()
        assert(!observable.observer, "Observer can't be set within batch update")
        observable.observer = observer
        observer?.observableDidUpdate(observable)
    }
}