//
//  ChatViewController.swift

import UIKit
import Firebase
@available(iOS 14.0, *)

class ChatViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var numberOfGuests: UITextField!
    @IBOutlet weak var buttonLabel: UIButton!
    
    let db = Firestore.firestore()
    let calendar = Calendar(identifier: .gregorian)
    override func viewDidLoad() {
        super.viewDidLoad()
        title = K.appName
        navigationItem.hidesBackButton = true
        
        
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        numberOfGuests.text = String(Int(sender.value))
    }
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }

    @IBAction func reservePressed(_ sender: UIButton) {
        if nameField.text == "" ||
            phoneField.text == "" ||
            emailField.text == "" ||
            numberOfGuests.text == "" {
            changeButtonColor()
            return
        }

        
    }
    func changeButtonColor() {
        //Your code to set button colors based on the correct answer goes here.
        //(I removed it for brevity)
        buttonLabel.backgroundColor = .red
        //When the timer goes off, restore your buttons to their default colors
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (timer) in

            self.buttonLabel.backgroundColor = .blue
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is BillingViewController {
            let vc = segue.destination as? BillingViewController
            vc?.numberOfGuests = Int(self.numberOfGuests.text!)!
        
            vc?.isHoliday = calendar.isDateInWeekend(dateField.date) || calendar.isDateAHoliday(dateField.date)
            let dateFormat = DateFormatter()
            dateFormat.dateStyle = .long
            dateFormat.timeStyle = .short
            vc?.datePicked = dateFormat.string(from: dateField.date)
        }
    }
}
