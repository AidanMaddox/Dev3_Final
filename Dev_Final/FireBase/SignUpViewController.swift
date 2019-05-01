//
//  SignUpViewController.swift
//  Dev_Final
//
//  Created by Andrew Hulin on 5/1/19.
//  Copyright © 2019 Aidan Maddox. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    // set up IB Outlets
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func signUpButton(_ sender: UIButton) {
        handleSignUp()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func handleSignUp() {
        guard let username = usernameField.text else {return}
        guard let email = emailField.text else {return}
        guard let pass = passwordField.text else {return}
        
        Auth.auth().createUser(withEmail: email, password: pass) { user, error in
            if error == nil && user != nil {
                print("User Created!")
                
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = username
                changeRequest?.commitChanges() { error in
                    if error == nil {
                        print("User display name changed")
                        self.dismiss(animated: false, completion: nil)
                    }
                }
            } else {
                print("Error: \(error!.localizedDescription)")
            }
        }
        
        
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
