//
//  BusinessDetailView.swift
//  Dev_Final
//
//  Created by Aidan Maddox on 4/30/19.
//  Copyright © 2019 Aidan Maddox. All rights reserved.
//

import UIKit

class BusinessDetailView: UIViewController {

    
    var model = BusinessModel.shared
    var receivedData : Int? //optinal index
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        var info = model.word(at: myIndex ?? 0, shouldUpdateCurrentIndex: false)
//        nameLabel.text = info[BusinessModel.key1]
//
        //nameLabel.text = receivedData
//        print(receivedData!)
        if let num = receivedData {
            if let word = model.word(at: num, shouldUpdateCurrentIndex: false) {
             nameLabel.text = word[BusinessModel.key1]
            descriptionLabel.text = word[BusinessModel.key2]
                // cell.detailTextLabel?.text = word[BusinessModel.key2]
            }
        }
        else{
            print("no index")
        }
      //  nameLabel.text = model.word(at: myIndex ?? 0, shouldUpdateCurrentIndex: false).word[BusinessModel.key1]
        
        //nameLabel.text = model.word(at: myIndex, shouldUpdateCurrentIndex: false)
        
        // Do any additional setup after loading the view.
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
