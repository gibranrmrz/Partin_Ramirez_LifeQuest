//
//  dailyTaskViewController.swift
//  Partin_Ramirez_LifeQuest
//
//  Created by Period Three on 2019-01-14.
//  Copyright © 2019 Gibran Ramirez. All rights reserved.
//

import UIKit

class dailyTaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //makes outlets for the table view and the level button as well as the tab bar
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var lvlOutlet: UIBarButtonItem!
    @IBOutlet weak var dailyTabBar: UITabBarItem!
    
    //makes a cell that has rows equal to the number of tasks and displays text that corespeonds to the titles
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theTaskArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourCellsTest = tableView.dequeueReusableCell(withIdentifier: "dailyCell1", for: indexPath)
        ourCellsTest.textLabel?.text = theTaskArray[indexPath.row].title
        return ourCellsTest
    }
    
    //adds a checkmark when a row is selected, adds the appropriate experience, and updates the level
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType != UITableViewCell.AccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
            levelUp(gained: 100)
            lvlOutlet.title = "Lvl: \(String(thisUser.level))"
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            levelUp(gained: -100)
        }
    }
    
    //allows the user to delete stuff
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        theTaskArray.remove(at: indexPath.row)
        taskTableView.deleteRows(at: [indexPath], with: .fade)
        
        //saveData()
    }
    
    //makes the new item view controller know it is making a daily task
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        num = 1
    }
    
    //tells the user how much XP is needed to level up when the level button is pressed
    @IBAction func lvlButtonPressed(_ sender: Any) {
        let lvlAlert = UIAlertController(title: "XP Needed to Level Up:", message: "\(levelUpXP - thisUser.currentXP)", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Ok", style: .default, handler: { (action) in lvlAlert.dismiss(animated: true, completion: nil)
        })
        lvlAlert.addAction(okayAction)
        present(lvlAlert, animated: true, completion: nil)
    
    }
    
    //makes an unwind segue to this view controller
    @IBAction func unwindToTask(unwindSegue: UIStoryboardSegue) {
    }
    
    //reloads level button and the data when the view will appear
    override func viewWillAppear(_ animated: Bool) {
        lvlOutlet.title = "Lvl: \(String(thisUser.level))"
        taskTableView.reloadData()
    }
    
    //updates the bar image when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        dailyTabBar.image = #imageLiteral(resourceName: "bed")
    }

}
