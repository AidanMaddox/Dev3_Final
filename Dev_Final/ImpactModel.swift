//
//  ImpactModel.swift
//  Dev_Final
//
//  Created by Aidan Maddox on 4/24/19.
//  Copyright © 2019 Aidan Maddox. All rights reserved.
//

import Foundation

class ImpactModel{
    //create singleton instance
    static let shared = ImpactModel()
    
    var filepath:String

    //declare keys
    static let key1 = "name"
    static let key2 = "description"
    
    var keys:[String]
    private var impacts: [[String:String]]
    var currentIndex: Int?    //Initializes currentIndex to value nil
    
    init() {
        
        keys = ["name","description"]
        impacts = [[String:String]]()
        currentIndex = 0
        
        // find the Documents directory
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        filepath = url!.appendingPathComponent("impactmodels.plist").path
        print("filepath=\(filepath)")
        
        // check to see if the file exists
        if FileManager.default.fileExists(atPath: filepath) {
            // read from file
            do {
                let url = URL(fileURLWithPath: filepath)
                let urlData = try Data(contentsOf: url)
                let plist = try PropertyListSerialization.propertyList(from: urlData, options: .mutableContainers, format: nil)
                impacts = plist as! [[String:String]]
            } catch {
                print("Could not get data from file")
            }
        } else {
            var object = ["name": "тот", "description": "That"]
            impacts.append(object)
            
            object = ["name": "это", "description": "This"]
            impacts.append(object)
            
            object = ["name": "Привет", "description": "Hello"]
            impacts.append(object)
            
            object = ["name": "Да", "description": "Yes"]
            impacts.append(object)
            
            object = ["name": "Спасибо", "description": "Thankyou"]
            impacts.append(object)
        }
        
        
    }
    
}
