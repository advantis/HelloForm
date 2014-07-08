//
//  Copyright © 2014 Yuri Kotov
//

extension ViewController: Observer {

    func observableDidUpdate(observable: Observable) {
        if let form = observable as? PaymentForm {
            reloadData(form)
        }
    }
}