//
//  LoginViewController.swift
//  Dev_Final
//
//  Created by Andrew Hulin on 5/1/19.
//  Copyright © 2019 Aidan Maddox. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
   
  
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBAction func logInButton(_ sender: Any) {
        handleSignUp()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func handleSignUp() {
        guard let email = emailField.text else {return}
        guard let pass = passwordField.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: pass) { user, error in
            if error == nil && user != nil {
                self.dismiss(animated: false, completion: nil)
            } else {
                print("error: \(String(describing: error?.localizedDescription))")
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
