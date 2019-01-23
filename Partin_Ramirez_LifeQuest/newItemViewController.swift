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
    @IBOutlet weak var taskSwitchOutlet: UISwitch!
    @IBOutlet weak var taskDatePicker: UIDatePicker!
    
    
    
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
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        switch num {
        case 1:
            performSegue(withIdentifier: "unwindToTask", sender: self)
        case 2:
            performSegue(withIdentifier: "unwindToGoal", sender: self)
        case 3:
            performSegue(withIdentifier: "unwindToLink", sender: self)
        default:
            print("f")
        }
    }
    @IBAction func donePressed(_ sender: Any) {
        guard let safeName = nameField.text else {return}
        guard safeName != "" else {return}
        switch num {
        case 1:
            let newTask = Task(title: safeName)
            theTaskArray.append(newTask)
            performSegue(withIdentifier: "unwindToTask", sender: self)
        case 2:
            let newGoal = Goal(title: safeName, done: false)
            theGoalArray.append(newGoal)
            performSegue(withIdentifier: "unwindToGoal", sender: self)
        case 3:
            let newLink = SocialLink(name: safeName, met: false)
            theLinkArray.append(newLink)
            performSegue(withIdentifier: "unwindToLink", sender: self)
        default:
            print("f")
        }
    }

}
