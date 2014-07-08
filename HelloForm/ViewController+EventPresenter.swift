//
//  Copyright © 2014 Yuri Kotov
//

extension ViewController: EventPresenter {
    
    func setEvent(event: Event) {
        self.event = event
        createForm(event)
    }
}