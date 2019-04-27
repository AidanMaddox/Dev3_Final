//
//  FirstViewController.swift
//  Dev_Final
//
//  Created by Aidan Maddox on 4/27/19.
//  Copyright © 2019 Aidan Maddox. All rights reserved.
//

import UIKit

class FirstViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //tabBar.selectedItem = [tabBarItem selectedIndex:1]; // set defualt tab
        self.selectedIndex = 1; // set default tab
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
