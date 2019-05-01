//
//  OtherFactorModel.swift
//  Dev_Final
//
//  Created by Aidan Maddox on 4/24/19.
//  Copyright © 2019 Aidan Maddox. All rights reserved.
//

import Foundation

class OtherFactorModel{
    //create singleton instance
    static let shared = OtherFactorModel()
    
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
        
        filepath = url!.appendingPathComponent("otherfactors.plist").path
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
            var object = ["name": "Blockchain", "description": "A blockchain, originally block chain, is a growing list of records, called blocks, which are linked using cryptography. Each block contains a cryptographic hash of the previous block, a timestamp, and transaction data. By design, a blockchain is resistant to modification of the data."]
            impacts.append(object)
            
            object = ["name": "Machine learning", "description": "Machine learning is the scientific study of algorithms and statistical models that computer systems use to effectively perform a specific task without using explicit instructions, relying on patterns and inference instead. It is seen as a subset of artificial intelligence."]
            impacts.append(object)
            
            object = ["name": "5G", "description": "5G networks are the next generation of mobile internet connectivity, offering faster speeds and more reliable connections on smartphones and other devices than ever before."]
            impacts.append(object)
            
            object = ["name": "Internet of Things", "description": "The Internet of things is the extension of Internet connectivity into physical devices and everyday objects. Embedded with electronics, Internet connectivity, and other forms of hardware, these devices can communicate and interact with others over the Internet, and they can be remotely monitored and controlled."]
            impacts.append(object)
            
            object = ["name": "Virtual Reality", "description": "Virtual reality is an interactive computer-generated experience taking place within a simulated environment. It incorporates mainly auditory and visual feedback, but may also allow other types of sensory feedback."]
            impacts.append(object)
            
            object = ["name": "Augmented Reality", "description": "Augmented reality is an interactive experience of a real-world environment where the objects that reside in the real-world are enhanced by computer-generated perceptual information, sometimes across multiple sensory modalities, including visual, auditory, haptic, somatosensory, and olfactory."]
            impacts.append(object)
            
            object = ["name": "Pop Up Shop", "description": "Pop-up retail, also known as pop-up store or flash retailing, is a trend of opening short-term sales spaces that started in Los Angeles and now pop up all over the United States, Canada, China, Japan, Mexico, France, Germany, the United Kingdom and Australia."]
            impacts.append(object)
            
            object = ["name": "Escape Room", "description": "An escape room, also known as an escape game, is a mental and physical adventure based game in which players solve a series of puzzles and riddles using clues, hints, and strategy to complete the objectives at hand."]
            impacts.append(object)
            
            object = ["name": "Social Media", "description": "Social media are interactive computer-mediated technologies that facilitate the creation and sharing of information, ideas, career interests and other forms of expression via virtual communities and networks."]
            impacts.append(object)
            
            object = ["name": "Big Data", "description": "Extremely large data sets that may be analyzed computationally to reveal patterns, trends, and associations, especially relating to human behavior and interactions."]
            impacts.append(object)
            
            object = ["name": "Voice Controlled", "description": "A device controlled with a voice user interface. Voice user interfaces have been added to automobiles, home automation systems, computer operating systems, home appliances like washing machines and microwave ovens, and television remote controls."]
            impacts.append(object)
            
            object = ["name": "Mobile Companion", "description": "Mobile assistants such as Siri and Cortana have increased in popularity over the past few years and assist users in automating tasks using voice commands."]
            impacts.append(object)
            
            object = ["name": "Security", "description": "Security is freedom from, or resilience against, potential harm (or other unwanted coercive change) caused by others. Beneficiaries (technically referents) of security may be of persons and social groups, objects and institutions, ecosystems or any other entity or phenomenon vulnerable to unwanted change by its environment."]
            impacts.append(object)
        }
        
        
    }
    func addWord(name: String, description: String){
        //possibly check to see if already in places
        let card = [ImpactModel.key1: name, ImpactModel.key2: description]
        impacts.append(card)
    }
    
    func save() {
        print("Save to file")
        
        // save the array of dictionary objects to a plist
        (impacts as NSArray).write(toFile: filepath, atomically: true)
        
    }
    
    func numberOfWords() -> Int{
        return impacts.count
    }
    //return a flashcard at given index and update the current index if shouldUpdateCurrent index is true
    func word(at index: Int, shouldUpdateCurrentIndex: Bool) -> [String : String]? {
        //ensure index is valid
        if index >= 0 && index < impacts.count {
            //check to update or not
            if(shouldUpdateCurrentIndex == true) { //if they want to update. update here
                currentIndex = index
            }
            return impacts[index]
        }
        else {
            return nil //return nil if invalid index
        }
    }
}

