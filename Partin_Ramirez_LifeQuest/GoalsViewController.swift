//
//  GoalsViewController.swift
//  Partin_Ramirez_LifeQuest
//
//  Created by Period Three on 2019-01-16.
//  Copyright © 2019 Gibran Ramirez. All rights reserved.
//

import UIKit

class GoalsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //outlets for the table view, level button, and the tab bar item
    @IBOutlet weak var goalTableView: UITableView!
    @IBOutlet weak var levelBarOutlet: UIBarButtonItem!
    @IBOutlet weak var goalBarItem: UITabBarItem!
    
    //makes a new cell that has rows equal to the number of goals, and corresponding titles
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theGoalArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourCellsTest = tableView.dequeueReusableCell(withIdentifier: "goalCell1", for: indexPath)
        ourCellsTest.textLabel?.text = theGoalArray[indexPath.row].title
        return ourCellsTest
    }
    
    //adds checkmarks whenever the user selects a row, adds the appropriate exp and updates the level
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType != UITableViewCell.AccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
            levelUp(gained: 200)
            levelBarOutlet.title = "Lvl: \(String(thisUser.level))"
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            
        }
    }
    
    //allows deleting
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        theGoalArray.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    //tells the new item view controller it is making a goal item
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        num = 2
    }
    
    //adds a checkmark when a row is selected, adds the appropriate experience, and updates the level
    @IBAction func levelButtonPressed(_ sender: Any) {
        let lvlAlert = UIAlertController(title: "XP Needed to Level Up:", message: "\(levelUpXP - thisUser.currentXP)", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Ok", style: .default, handler: { (action) in lvlAlert.dismiss(animated: true, completion: nil)
        })
        lvlAlert.addAction(okayAction)
        present(lvlAlert, animated: true, completion: nil)
    }
    
    //unwind segue
    @IBAction func unwindToGoal(unwindSegue: UIStoryboardSegue) {
    }
    
    //reloads level button and the data when the view will appear
    override func viewWillAppear(_ animated: Bool) {
        levelBarOutlet.title = "Lvl: \(String(thisUser.level))"
        goalTableView.reloadData()
    }
    
    //updates the bar item when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        goalBarItem.image = #imageLiteral(resourceName: "goal")
    }

}
