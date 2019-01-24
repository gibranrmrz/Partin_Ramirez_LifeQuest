//
//  newItemViewController.swift
//  Partin_Ramirez_LifeQuest
//
//  Created by Period Three on 2019-01-16.
//  Copyright © 2019 Gibran Ramirez. All rights reserved.
//

import UIKit
import UserNotifications

class newItemViewController: UIViewController, UITextFieldDelegate {

    // Outlets
    @IBOutlet weak var taskBarTitle: UINavigationItem!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var taskSwitchOutlet: UISwitch!
    @IBOutlet weak var taskDatePicker: UIDatePicker!
    
    // Variables
    var remindTime = Date()
    
    // Sets the titles of bar titles depending on the tab
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
    
    // Defaults reminder switch to off, requests notifications, and allows dismissing keyboard by tapping
    override func viewDidLoad() {
        super.viewDidLoad()
        taskSwitchOutlet.isOn = false
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
        self.nameField.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    // Formats dates
    func newDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
    }
    
    // Dismiss keyboard when return is tapped
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameField.resignFirstResponder()
        return true
    }
    
    // When cancel is tapped go back to the tabs
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
    
    // When done is pressed append to respective arrays and go back to tabs. If no names are entered dont save anything
    @IBAction func donePressed(_ sender: Any) {
        guard let safeName = nameField.text else {return}
        guard safeName != "" else {return}
        if taskSwitchOutlet.isOn == true {
            notifications()
        }
        switch num {
        case 1:
            let newTask = Task(title: safeName)
            theTaskArray.append(newTask)
            performSegue(withIdentifier: "unwindToTask", sender: self)
        case 2:
            let newGoal = Goal(title: safeName)
            theGoalArray.append(newGoal)
            performSegue(withIdentifier: "unwindToGoal", sender: self)
        case 3:
            let newLink = SocialLink(name: safeName)
            theLinkArray.append(newLink)
            performSegue(withIdentifier: "unwindToLink", sender: self)
        default:
            print("f")
        }
        
    }

    // Adds functionality for notifications
    func notifications() {
        remindTime = taskDatePicker.date
        let content = UNMutableNotificationContent()
        guard let safeText = nameField.text else {return}
        content.title = safeText
        content.badge = 1
        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: remindTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        let request = UNNotificationRequest(identifier: "studyTime", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    
    }
}
