//
//  Copyright © 2014 Yuri Kotov
//

import UIKit

class PaymentFormViewController: UITableViewController {

    var form: PaymentForm! = nil

    @lazy var updater: BatchUpdater = BatchUpdater(self.form)
    @lazy var validator: PaymentFormValidator = PaymentFormValidator(delegate: self)
    @lazy var numericFilter = NumericInputFilter()
    @lazy var expiryFilter = ExpiryInputFilter()
    @lazy var expiryFormatter = NSDateFormatter(format: "MM/yyyy")

    @IBOutlet
    var eventName: UILabel

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
        eventName.text = form.event.name
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

extension PaymentFormViewController: UITextFieldDelegate {
    func textField(textField: UITextField!, shouldChangeCharactersInRange range: NSRange, replacementString string: String!) -> Bool {
        // TODO: Remove the bridging cast below when NSString/String API become consistent
        let original: NSString = textField.text
        let modified = original.stringByReplacingCharactersInRange(range, withString: string)

        switch textField {
            case numberField, cvcField:
                return numericFilter.validate(modified, error: nil)
            case expiryField:
                return expiryFilter.validate(modified, error: nil)
            default:
                return true
        }
    }
}

