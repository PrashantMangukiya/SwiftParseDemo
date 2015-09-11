//
//  RegisterViewController.swift
//  SwiftParseDemo
//
//  Created by Prashant on 10/09/15.
//  Copyright (c) 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit
import Parse


class RegisterViewController: UIViewController, UITextFieldDelegate {

    
    // outlet - activity indicator (spinner)
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    // outlet and action - email
    @IBOutlet var emailText: UITextField!
    @IBAction func emailTextEditingChanged(sender: UITextField) {
        // validate input while entering text
        self.validateInput()
    }
    
    // outlet and action - username
    @IBOutlet var usernameText: UITextField!
    @IBAction func usernameTextEditingChanged(sender: UITextField) {
        // validate input while entering text
        self.validateInput()
    }
    
    // outlet and action - password
    @IBOutlet var passwordText: UITextField!
    @IBAction func passwordTextEditingChanged(sender: UITextField) {
        // validate input while entering text
        self.validateInput()
    }
    
    // outlet and action - retype password
    @IBOutlet var passwordRetypeText: UITextField!
    @IBAction func passwordRetypeTextEditingChanged(sender: UITextField) {
        // validate input while entering text
        self.validateInput()
    }
    
    // outlet and action - sign in button
    @IBOutlet var signUpButton: UIButton!
    @IBAction func signUpButtonAction(sender: UIButton) {
        
        // end editing i.e. close keyboard if open
        self.view.endEditing(true)
        
        // do user registration
        self.doSignUp()
    }
    
    // outlet - close button
    @IBAction func closeButtonAction(sender: UIButton) {
        // close the register screen
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    // MARK: - View functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // stop spinner at view load
        self.spinner.stopAnimating()
        
        // set textfield delegate
        self.emailText.delegate = self
        self.usernameText.delegate = self
        self.passwordText.delegate = self
        self.passwordRetypeText.delegate = self
        
        // disable signup button
        self.signUpButton.enabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    
    
    
    
    // MARK: - text field delegate function
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
    // MARK: - Utility functions
    
    // register user within parse database
    private func doSignUp() -> Void {
        
        // show spinner for task in progress
        self.spinner.startAnimating()
        
        // collect email,username,password info from text field.
        var email = self.emailText.text
        var username = self.usernameText.text
        var password  = self.passwordText.text
        
        // create empty user object
        var newUser = PFUser()
        
        // set value for user info
        newUser.email = email
        newUser.username = username
        newUser.password = password
        
        // Perform new user sign up with parse server.
        newUser.signUpInBackgroundWithBlock({ (success , error) -> Void in
            
            // Stop the spinner
            self.spinner.stopAnimating()
            
            // if error not nil means something wrong with registration
            if (error != nil) {
                
                // show error message
                self.showAlertMessage(alertTitle: "Error", alertMessage: error!.localizedDescription)
                
            } else {
                
                // show registration success message 
                // and close registration screen when Ok button presssed.
                let alertCtrl = UIAlertController(title: "Success", message: "Registered successfully.", preferredStyle: UIAlertControllerStyle.Alert)

                let okAction  = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { (action ) -> Void in
                    // close registration screen
                    self.dismissViewControllerAnimated( true, completion: nil)
                })
                
                alertCtrl.addAction(okAction)
                
                self.showViewController(alertCtrl, sender: self)
            }
        })
        
    }
    
    
    // validate input data, disable sign in button if any input not valid.
    private func validateInput() -> Void {
        
        var isValidInput : Bool = true
        
        // if any input not valid then set status false
        if count(self.emailText.text) < 4 {
            isValidInput = false
        }
        if count(self.usernameText.text) < 4 {
            isValidInput = false
        }
        if count(self.passwordText.text) < 4 {
            isValidInput = false
        }
        if count(self.passwordRetypeText.text) < 4 {
            isValidInput = false
        }
        if self.passwordText.text != self.passwordRetypeText.text {
            isValidInput = false
        }
        
        // if valid input then enable sign in button
        if isValidInput {
            self.signUpButton.enabled = true
        }else{
            self.signUpButton.enabled = false
        }
    }
    
    
    
    // show alert message with given title and message
    private func showAlertMessage(#alertTitle: String, alertMessage: String) -> Void {
        
        let alertCtrl = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        
        alertCtrl.addAction(okAction)
        
        self.showViewController(alertCtrl, sender: self)
    }

    
}
