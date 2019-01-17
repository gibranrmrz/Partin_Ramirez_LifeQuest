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
    @IBOutlet weak var nameField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        switch num {
        case 1:
            taskBarTitle.title = "Add Task"
        case 2:
            taskBarTitle.title = "Add Goal"
        case 3:
            taskBarTitle.title = "Add Social Link"
        default:
            print("f")
        }
    }
    
    @IBAction func donePressed(_ sender: Any) {
        guard let safeName = nameField.text else {return}
        switch num {
        case 1:
            let newTask = Task(title: safeName, completed: false)
            theTaskArray.append(newTask)
            performSegue(withIdentifier: "unwindToTask", sender: self)
        case 2:
            let newGoal = Goal(title: safeName, done: false)
            theGoalArray.append(newGoal)
        case 3:
            let newLink = SocialLink(name: safeName, met: false)
            theLinkArray.append(newLink)
            performSegue(withIdentifier: "unwindToGoal", sender: self)
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
