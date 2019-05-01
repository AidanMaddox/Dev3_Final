//
//  NotesModel.swift
//  Dev_Final
//
//  Created by Aidan Maddox on 4/27/19.
//  Copyright © 2019 Aidan Maddox. All rights reserved.
//

import Foundation

class NotesModel{
    
    static let shared = NotesModel()
    
    var filepath:String
    
    //declare keys
    static let keyName = "nName"
   // static let keyInfo = "nInfo"
    
    static let keyRev = "nRevenue"
    static let keyImp = "nImpact"
    static let keyOth = "nOther"
    static let keyNote = "nNotes"
    static let keyImg = "nImg"
    
    var keys:[String]
//    private var notes: [[[String:String]]]
    
    private var notes: [[String:String]]
    
    var currentIndex: Int?    //Initializes currentIndex to value nil
    
    init() {
        
        keys = ["nName","nRevenue","nImpact","nOther","nNotes","nImg"]
        notes = [[String:String]]()
        
        
        // find the Documents directory
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        filepath = url!.appendingPathComponent("notes.plist").path
        print("filepath=\(filepath)")
        
        // check to see if the file exists
        if FileManager.default.fileExists(atPath: filepath) {
            // read from file
            do {
                let url = URL(fileURLWithPath: filepath)
                let urlData = try Data(contentsOf: url)
                let plist = try PropertyListSerialization.propertyList(from: urlData, options: .mutableContainers, format: nil)
                notes = plist as! [[String:String]]
            } catch {
                print("Could not get data from file")
            }
        }
        else{
            var object = ["nName": "Test", "nRevenue": "B2B", "nImpact": "1 for 1", "nOther": "Eco Friendly", "nNotes": "Our goal is to create a B2B company that cares about people.", "nImg": "adfsasdf"]
            notes.append(object)
            //notes["Temp"] = object
            //print(object)
            //notes.append(object as! [String : [String : String]])
//            object = ["nName": "Test2", "nInfo": ["nRevenue": "B2B2C", "nImpact": "1 for 5", "nOther": "Ocean Friendly", "nNotes": "Our goal is to create a B2B company that cares about the ocean.", "nImg": "adfsasdf"]] as [String : Any]
            //notes.append(object as! [String : [String : String]])
            print(object)
        }
    
}
    
    
    func addNote(nName: String, nRev: String, nImp: String, nOth: String, nNote:String, nImg: String){
        //possibly check to see if already in places
        let note = [ NotesModel.keyName: nName,NotesModel.keyRev: nRev, NotesModel.keyImp: nImp, NotesModel.keyOth: nOth, NotesModel.keyNote: nNote, NotesModel.keyImg: nImg]
        notes.append(note)
    }
    
    func numberOfNotes() -> Int{
        return notes.count
    }
    
    func save() {
        print("Save to file")
        
        // save the array of dictionary objects to a plist
        (notes as NSArray).write(toFile: filepath, atomically: true)
        
    }
    //return a note at given index and update the current index if shouldUpdateCurrent index is true
    func returnNote(at index: Int, shouldUpdateCurrentIndex: Bool) -> [String:String]? {
        //ensure index is valid
        if index >= 0 && index < notes.count {
            //check to update or not
            if(shouldUpdateCurrentIndex == true) { //if they want to update. update here
                currentIndex = index
            }
            return notes[index]
        }
        else {
            return nil //return nil if invalid index
        }
    }
    
}
