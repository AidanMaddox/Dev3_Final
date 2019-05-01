//
//  NotesDetailView.swift
//  Dev_Final
//
//  Created by Aidan Maddox on 5/1/19.
//  Copyright © 2019 Aidan Maddox. All rights reserved.
//

import UIKit

class NotesDetailView: UIViewController {

    var model = NotesModel.shared
    var receivedData : Int? //optinal index
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var revLabel: UILabel!
    @IBOutlet weak var impLabel: UILabel!
    @IBOutlet weak var otherLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let num = receivedData {
            if let note = model.returnNote(at: num, shouldUpdateCurrentIndex: false) {
                nameLabel.text = note[NotesModel.keyName]
                revLabel.text = note[NotesModel.keyRev]
                impLabel.text = note[NotesModel.keyImp]
                otherLabel.text = note[NotesModel.keyOth]
                noteLabel.text = note[NotesModel.keyNote]
                // cell.detailTextLabel?.text = word[BusinessModel.key2]
            }
        }
        else{
            print("no index")
        }    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
