//
//  HomeViewController.swift
//  SwiftParseDemo
//
//  Created by Prashant on 10/09/15.
//  Copyright (c) 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit
import Parse


class HomeViewController: UIViewController {

    
    // outlet - photo placeholer
    @IBOutlet var userPhoto: UIImageView!
    
    
    // outlet - welcome label
    @IBOutlet var welcomeLabel: UILabel!
    
    
    // outlet and action - logout button
    @IBOutlet var logoutButton: UIButton!
    @IBAction func logoutButtonAction(sender: UIButton) {
        
        // logout from parse
        PFUser.logOut()
        
        // set welcome label as guest
        self.welcomeLabel.text = "Welcome, " + "Guest"
                
        // show login screen
        self.performSegueWithIdentifier("segueLogin", sender: self)
    }

    
    
    
    // MARK: - View function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // make photo placeholder round
        self.userPhoto.layer.cornerRadius = self.userPhoto.frame.width/2
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // if user not logged in then show login screen
        // Note: this function must in viewDidAppear,
        // so it check login everytime home screen appear
        if (PFUser.currentUser() == nil) {
            
            // hide logout button
            self.logoutButton.hidden = true

            // set welcome label as guest
            self.welcomeLabel.text = "Welcome, " + "Guest"
            
            // show login screen
            self.performSegueWithIdentifier("segueLogin", sender: self)
            
        }else{
            
            // show logout button
            self.logoutButton.hidden = false
            
            // Show username with welcome label
            if let parseUserName = PFUser.currentUser()?["username"] as? String {
                self.welcomeLabel.text = "Welcome, " + parseUserName
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
