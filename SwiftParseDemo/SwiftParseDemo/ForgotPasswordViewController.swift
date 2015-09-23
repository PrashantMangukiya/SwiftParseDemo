//
//  ForgotPasswordViewController.swift
//  SwiftParseDemo
//
//  Created by Prashant on 10/09/15.
//  Copyright (c) 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit
import Parse


class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {
    
    
    // outlet - activity indicator (spinner)
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    
    // outlet and action - email
    @IBOutlet var emailText: UITextField!
    @IBAction func emailTextEditingChanged(sender: UITextField) {
        // validate input while entering text
        self.validateInput()
    }
    
    
    // outlet and action - submit button
    @IBOutlet var submitButton: UIButton!
    @IBAction func submitButtonAction(sender: UIButton) {

        // end editing i.e. close keyboard if open
        self.view.endEditing(true)
        
        // submit password reset request to parse
        self.doSubmit()
    }
    
    // action - close button
    @IBAction func closeButtonAction(sender: UIButton) {
        // close the curren screen
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    // MARK: - view functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // stop spinner at view load
        self.spinner.stopAnimating()
        
        // set textfield delegate
        self.emailText.delegate = self
        
        // disable submit button
        self.submitButton.enabled = false
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
    
    private func doSubmit() -> Void {

        // show spinner for task in progress
        self.spinner.startAnimating()
        
        // collect email from text field.
        let email = self.emailText.text
        
        // Send asynchronous password reset request to parse server
        PFUser.requestPasswordResetForEmailInBackground(email!, block: { (success,error) -> Void in

            // stop the spinner
            self.spinner.stopAnimating()
            
            // if error then show message.
            if error != nil {
                
                self.showAlertMessage(alertTitle: "Error", alertMessage: error!.localizedDescription )
                
            }else{
                
                // show sucess message and close screen when Ok button presssed.
                let alertCtrl = UIAlertController(title: "Success", message: "Password reset instruction email has been sent to " +  email! , preferredStyle: UIAlertControllerStyle.Alert)
                
                let okAction  = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { (action ) -> Void in
                    // close password resetscreen
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
        if self.emailText.text!.characters.count < 4 {
            isValidInput = false
        }
        
        // if valid input then enable submit button
        if isValidInput {
            self.submitButton.enabled = true
        }else{
            self.submitButton.enabled = false
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
