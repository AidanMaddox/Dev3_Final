//
//  BusinessAddViewController.swift
//  Dev_Final
//
//  Created by Aidan Maddox on 4/27/19.
//  Copyright © 2019 Aidan Maddox. All rights reserved.
//

import UIKit

class BusinessAddViewController: UIViewController {

    @IBOutlet var tap: UITapGestureRecognizer!
    @IBOutlet weak var save: UIBarButtonItem!
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet var tfDescription: UITextView!
    
    var model = BusinessModel.shared // model

    
    override func viewDidLoad() {
        super.viewDidLoad()

        save.isEnabled = false //initialize to false
        // Do any additional setup after loading the view.
    }
    
    //recognize tap to close keyboard
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        tfName.resignFirstResponder()
        tfDescription.resignFirstResponder()
        
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        tfName.text = "" //reset values to blank
        tfDescription.text = ""
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        if let nameText = tfName.text, let descriptionText = tfDescription.text {
            model.addWord(nameT: nameText, descriptionT: descriptionText) //add card to model
            model.save() //save to actual model
            print("Saved to model")
        }
        dismiss(animated: true, completion: nil) //leave window once saved
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
