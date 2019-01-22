//
//  GoalsViewController.swift
//  Partin_Ramirez_LifeQuest
//
//  Created by Period Three on 2019-01-16.
//  Copyright © 2019 Gibran Ramirez. All rights reserved.
//

import UIKit

class GoalsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        levelBarOutlet.title = "Lvl: \(String(thisUser.level))"
    }
    
    @IBOutlet weak var goalTableView: UITableView!
    @IBOutlet weak var levelBarOutlet: UIBarButtonItem!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theGoalArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourCellsTest = tableView.dequeueReusableCell(withIdentifier: "goalCell1", for: indexPath)
        ourCellsTest.textLabel?.text = theGoalArray[indexPath.row].title
        return ourCellsTest
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType != UITableViewCell.AccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
            levelUp(gained: 200)
            levelBarOutlet.title = "Lvl: \(String(thisUser.level))"
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        theGoalArray.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        num = 2
    }
    @IBAction func unwindToGoal(unwindSegue: UIStoryboardSegue) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        goalTableView.reloadData()
    }
    
    @IBAction func levelButtonPressed(_ sender: Any) {
        let lvlAlert = UIAlertController(title: "XP Needed to Level Up:", message: "\(levelUpXP - thisUser.currentXP)", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Ok", style: .default, handler: { (action) in lvlAlert.dismiss(animated: true, completion: nil)
        })
        lvlAlert.addAction(okayAction)
        present(lvlAlert, animated: true, completion: nil)
    }

}
