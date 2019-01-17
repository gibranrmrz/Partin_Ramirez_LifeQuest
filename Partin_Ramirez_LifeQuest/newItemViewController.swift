//
//  newItemViewController.swift
//  Partin_Ramirez_LifeQuest
//
//  Created by Period Three on 2019-01-16.
//  Copyright © 2019 Gibran Ramirez. All rights reserved.
//

import UIKit

class newItemViewController: UIViewController {

    @IBOutlet weak var taskBarTitle: UINavigationItem!
    
    override func viewWillAppear(_ animated: Bool) {
        switch num {
        case 1:
            taskBarTitle.title = "Add Task"
        case 2:
            taskBarTitle.title = "Add Goal"
        default:
            print("f")
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
