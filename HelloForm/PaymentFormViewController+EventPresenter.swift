//
//  Copyright © 2014 Yuri Kotov
//

extension PaymentFormViewController: EventPresenter {
    
    func setEvent(event: Event, withContext context: EventContext) {
        createForm(event)
    }
}