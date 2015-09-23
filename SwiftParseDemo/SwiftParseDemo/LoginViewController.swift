//
//  LoginViewController.swift
//  SwiftParseDemo
//
//  Created by Prashant on 10/09/15.
//  Copyright (c) 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit
import Parse


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // outlet - activity indicator (spinner)
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    // outlet and action - username
    @IBOutlet var usernameText: UITextField!
    @IBAction func usernameEditingChanged(sender: UITextField) {
        // validate input while entering text
        self.validateInput()
    }
    
    // outlet and action - password
    @IBOutlet var passwordText: UITextField!
    @IBAction func passwordTextEditingChanged(sender: UITextField) {
        // validate input while entering text
        self.validateInput()
    }
    
    // outlet and action - sign in button
    @IBOutlet var signInButton: UIButton!
    @IBAction func signInButtonAction(sender: UIButton) {

        // end editing i.e. close keyboard if open
        self.view.endEditing(true)
        
        // do parse login
        self.doSignIn()
    }
    
    // action - forgot password button
    @IBAction func forgotPasswordAction(sender: UIButton) {
        self.performSegueWithIdentifier("segueForgotPassword", sender: self)
    }
    
    // action - new user signup button
    @IBAction func userRegisterAction(sender: UIButton) {
        self.performSegueWithIdentifier("segueUserRegister", sender: self)
    }
    
    
    
    
    // MARK: - view functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // stop spinner at view load
        self.spinner.stopAnimating()
        
        // set text field delegate
        self.passwordText.delegate = self
        self.usernameText.delegate = self
        
        // disable sign in button
        self.signInButton.enabled = false
    }
    
    override func viewDidAppear(animated: Bool) {
        // if user logged in then close the screen
        if PFUser.currentUser() != nil {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
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
    
    // perform sign in within parse database
    private func doSignIn() -> Void {
        
        // show spinner for task in progress
        self.spinner.startAnimating()
        
        // collect username, password value from text field.
        let username = self.usernameText.text
        let password  = self.passwordText.text
        
        // Send asynchronous login request to parse server
        PFUser.logInWithUsernameInBackground(username!, password: password!, block: { (user, error) -> Void in
            
            // Stop the spinner
            self.spinner.stopAnimating()
            
            // if user object not nil means login success, otherwise show error message.
            if ( user != nil ) {
                                                
                // close login screen
                self.dismissViewControllerAnimated(true, completion: nil)
            }else{
                // show error message
                self.showAlertMessage(alertTitle: "Error!", alertMessage: "Invalid username or password.")
            }
            
        })
        
    }
    
    // validate input data, disable sign in button if any input not valid.
    private func validateInput() -> Void {
    
        var isValidInput : Bool = true
        
        // if any input not valid then set status false
        if self.usernameText.text!.characters.count < 4 {
            isValidInput = false
        }
        if self.passwordText.text!.characters.count < 4 {
            isValidInput = false
        }
        
        // if valid input then enable sign in button
        if isValidInput {
            self.signInButton.enabled = true
        }else{
            self.signInButton.enabled = false
        }
    }
    
    
    
    // show alert message with given title and message
    private func showAlertMessage(alertTitle alertTitle: String, alertMessage: String) -> Void {
        
        let alertCtrl = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        
        alertCtrl.addAction(okAction)
        
        self.showViewController(alertCtrl, sender: self)
    }
    
            
}
