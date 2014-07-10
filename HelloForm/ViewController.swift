//
//  Copyright © 2014 Yuri Kotov
//

import UIKit

class ViewController: UIViewController {

    var event: Event?
    var form: PaymentForm! = nil

    @lazy var updater: BatchUpdater = BatchUpdater(self.form)
    @lazy var validator: PaymentFormValidator = PaymentFormValidator(delegate: self)
    @lazy var expiryFormatter = NSDateFormatter(format: "MM/yyyy")

    @IBOutlet
    var emailField: TextField

    @IBOutlet
    var numberField: TextField

    @IBOutlet
    var expiryField: TextField

    @IBOutlet
    var cvcField: TextField

    @IBOutlet
    var quantityLabel: UILabel

    @IBOutlet
    var quantityStepper: UIStepper

    @IBOutlet
    var submitButton: UIButton


    override func viewDidLoad() {
        super.viewDidLoad()
        if form {
            reloadData(form!)
        }
    }

    func createForm(event: Event) {
        form = PaymentForm(event)
        form.observer = self
        if (isViewLoaded()) {
            reloadData(form!)
        }
    }

    func reloadData(form: PaymentForm) {
        emailField.text = form.email
        quantityLabel.text = String(form.quantity)
        quantityStepper.maximumValue = Double(form.event.quantity)
        expiryField.text = expiryField.text
        numberField.text = form.number
        cvcField.text = form.cvc
        submitButton.enabled = validator.validate(form, error:nil)
    }

    @IBAction
    func contentDidChange() {
        updater.update {
            self.form.cvc = self.cvcField.text
            self.form.email = self.emailField.text
            self.form.number = self.numberField.text
            self.form.quantity = Int(self.quantityStepper.value)
            self.form.expiry = self.expiryFormatter.dateFromString(self.expiryField.text)
        }
    }

    @IBAction
    func textFieldDidReturn(sender: FormNavigation) {
        if let nextField = sender.nextField as? UIResponder {
            nextField.becomeFirstResponder()
        }
    }

    @IBAction
    func submit() {
        form.submitWithHandler({result in
            switch result {
                case .Success:
                    println("success")
                case .Failure(let error):
                    println(error)
            }
        });
    }
}

