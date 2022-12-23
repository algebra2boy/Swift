//
//  ViewController.swift
//  IntroduceStudent
//
//  Created by Yongye Tan on 12/21/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var morePetsSwitch: UISwitch!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    
    
    @IBOutlet weak var numberofPetsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /// update the number of pets
    /// the value starts off at 0, and it will not go below 0
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numberofPetsLabel.text = "\(Int(sender.value))"
    }
    
    
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        
        // choose the title we have selected from teh segmented control
        // either First, second, third, or fourth
        
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
        
        if (firstNameTextField.text == "" || lastNameTextField.text == "" || schoolNameTextField.text == "") {
            alertWindow("Warning", "Missing required text", "Try again!")
        }
        
        // create a constant for the introduction
        let introduction = """
        Hi, my name is \(firstNameTextField.text!) \(lastNameTextField.text!)
        and I study at \(schoolNameTextField.text!). I am currently a \(year!) student. I have \(numberofPetsLabel.text!) pets.
        It is \(morePetsSwitch.isOn) that I want more pets!
        """
        
        alertWindow("My introduction", introduction, "Nice to meet you!")
        
    }
    
    @IBAction func backgroundDidChange(_ sender: UIButton){
        view.backgroundColor = .systemYellow
    }
    
    @IBAction func whatIsThisAbout(_ sender: UIButton) {
        // create a constant for the introduction
        let message = """
        This will be my second iOS development course
        at Codepath! Hopefully to learn more about
        design and UI aspect mixed with coding part in Swift
        """
        alertWindow("What is this about", message, "Thank you")
        
    }
    
    func alertWindow (_ alert_title: String, _ message: String,
                      _ action_title: String) {
        // creates the alert window when we pass in our message
        let alertController = UIAlertController(
                title: alert_title,
                message: message,
                preferredStyle: .alert)
        
        // create the action so the alert window will pop out
        let action = UIAlertAction(
            title: action_title,
            style: .default,
            handler: nil)
        
        // attach the alert window to the alert action
        alertController.addAction(action)
        
        // present the alert pop up
        present(alertController, animated: true, completion: nil)
    }
    
    
}

