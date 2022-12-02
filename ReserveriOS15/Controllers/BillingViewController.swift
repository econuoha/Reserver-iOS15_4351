//
//  BillingViewController.swift

import UIKit
import Firebase

@available(iOS 14.0, *)
@available(iOS 14.0, *)
class BillingViewController: UIViewController {
    @IBOutlet weak var mailingField: UITextField!
    @IBOutlet weak var billingField: UITextField!
    @IBOutlet weak var perferedNumber: UITextField!
    @IBOutlet weak var billingNameField: UITextField!
    @IBOutlet weak var pointsEarned: UITextField!
    @IBOutlet weak var paymentButton: UIButton!
    @IBOutlet weak var holidayText: UITextField!
    var isHoliday = false
    var numberOfGuests = 0
    var datePicked = ""
    override func viewDidLoad() {
        holidayText.isHidden = !isHoliday
        if isHoliday {
            paymentButton.isEnabled = false
        }
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { (timer) in

            let n = Int.random(in: 1000000...9999999)
            self.perferedNumber.text = String(n)
        }
        pointsEarned.text = "Points Earned: \(String(Int(exactly: numberOfGuests)! * 3))"
        setPopupButton()
        
    }
    
    @IBAction func paymentMethodPressed(_ sender: UIButton) {
        
    }
    @IBAction func switchPressed(_ sender: UISwitch) {
        if sender.isOn {
            if mailingField.text != "" {
                billingField.text = mailingField.text
                billingField.isEnabled = false
            }
        }
        else {
            billingField.isEnabled = true
            billingField.text = ""
        }
    }
    
    @available(iOS 14.0, *)
    func setPopupButton() {
        let optionClosure = {(action: UIAction) in
            print(action.title)}
        
        paymentButton.menu = UIMenu (children: [
            UIAction(title:"Card", state: .on, handler: optionClosure),
            UIAction(title:"Check", handler: optionClosure),
            UIAction(title:"Cash", handler: optionClosure),
            UIAction(title:"Venmo", handler: optionClosure),
            UIAction(title:"Cashapp", handler: optionClosure),
            UIAction(title:"Paypal", handler: optionClosure)
        ])
        paymentButton.showsMenuAsPrimaryAction = true
        if #available(iOS 15.0, *) {
            paymentButton.changesSelectionAsPrimaryAction = true
        } else {
            // Fallback on earlier versions
        }
        }
    
    @IBAction func submitPressed(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ConfirmationViewController {
            let vc = segue.destination as? ConfirmationViewController
            vc?.numberOfGuests = String(numberOfGuests)
            vc?.dateChosen = datePicked
            vc?.pointsEarnedPassed = pointsEarned.text!
            
        }
    }
}
