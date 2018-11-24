//
//  ViewController.swift
//  Zwaste
//
//  Created by Braxton Madison on 11/23/18.
//  Copyright © 2018 GeorgiaTech. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    //Radio Button for User Type:
    @IBOutlet weak var radioBtn: DLRadioButton!
    @IBAction func radioAction(_ sender: DLRadioButton) {
        //tag1 is User, tag2 is Location Employee, tag3 is Manager
        if sender.tag == 1 {
            print("User")
        } else if sender.tag == 2 {
            print("Location Employee")
        } else if sender.tag == 3 {
            print("Manager")
        } else {
            print("Please select a user type.")
        }
    }
    //Outlets for the login page and login func:
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var feedbackMessage: UILabel!
    @IBAction func loginButtonClicked(_ sender: Any) {
        login()
    }
    //Outlets for the signup page and signup fun (su = signup):
    @IBOutlet weak var suNameField: UITextField!
    @IBOutlet weak var suEmailField: UITextField!
    @IBOutlet weak var suPasswordField: UITextField!
    @IBOutlet weak var suSubmitButton: UIButton!
    @IBOutlet weak var suCancelButton: UIButton!
    @IBOutlet weak var suFeedbackMessage: UILabel!
    @IBAction func suSubmitButtonClicked(_ sender: Any) {
        signup()
    }
    
    
    //Default function:
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //Login Function:
    func login() {
        if self.emailField.text == "" || self.passwordField.text == "" {
            feedbackMessage.text = "Please enter your email and password."
        } else if !(self.emailField.text?.contains("@"))! || !(self.emailField.text?.contains("."))! {
            feedbackMessage.text = "Please enter a valid email."
        } else if (self.passwordField.text?.count)! < 5 {
            feedbackMessage.text = "Password must be at least 5 characters."
        } else {
            Auth.auth().signIn(withEmail: self.emailField.text!, password: self.passwordField.text!) { (user, error) in
                if error == nil {
                    self.feedbackMessage.text = "You have successfully logged in."
                } else {
                    self.feedbackMessage.text = "Login failed. Please try again."
                }
            }
            
        }
    }
    //Signup Function:
    func signup() {
        if self.suEmailField.text == "" || self.suPasswordField.text == "" || self.suNameField.text == "" {
            suFeedbackMessage.text = "Please enter name, email and password."
        } else if !(self.suEmailField.text?.contains("@"))! || !(self.suEmailField.text?.contains("."))! {
            suFeedbackMessage.text = "Please enter a valid email."
        } else if (self.suPasswordField.text?.count)! < 5 {
            suFeedbackMessage.text = "Password must be at least 5 characters."
        } else {
            Auth.auth().createUser(withEmail: suEmailField.text!, password: suPasswordField.text!) { (user, error) in
                if error == nil {
                    self.suFeedbackMessage.text = "Sign up was successful."
                } else {
                    self.suFeedbackMessage.text = "Sign up failed."
                }
            }
        }
        
    }


}

