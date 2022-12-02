//
//  ConfirmationViewController.swift

import UIKit

class ConfirmationViewController: UIViewController {
    
    var dateChosen = ""
    var numberOfGuests = ""
    var pointsEarnedPassed = ""
    
    @IBOutlet weak var pointsEarned: UITextField!
    @IBOutlet weak var numGuest: UITextField!
    @IBOutlet weak var dateText: UITextField!
    
    override func viewDidLoad() {
        pointsEarned.text = pointsEarnedPassed
        numGuest.text = numberOfGuests
        dateText.text = dateChosen
    }
    
}
