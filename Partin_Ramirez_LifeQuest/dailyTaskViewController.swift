//
//  dailyTaskViewController.swift
//  Partin_Ramirez_LifeQuest
//
//  Created by Period Three on 2019-01-14.
//  Copyright © 2019 Gibran Ramirez. All rights reserved.
//

import UIKit

class dailyTaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var lvlOutlet: UIBarButtonItem!
    
    @IBOutlet weak var dailyTabBar: UITabBarItem!
    
    
    //var taskArray: [Int] = [0, 1]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theTaskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourCellsTest = tableView.dequeueReusableCell(withIdentifier: "dailyCell1", for: indexPath)
        ourCellsTest.textLabel?.text = theTaskArray[indexPath.row].title
        /*if theTaskArray[indexPath.row].completed {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        }*/
        return ourCellsTest
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType != UITableViewCell.AccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
            //theTaskArray[indexPath.row].completed = true
            levelUp(gained: 100)
            lvlOutlet.title = "Lvl: \(String(thisUser.level))"
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            //theTaskArray[indexPath.row].completed = false
            levelUp(gained: -100)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        theTaskArray.remove(at: indexPath.row)
        taskTableView.deleteRows(at: [indexPath], with: .fade)
        
        //saveData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        num = 1
    }
    
    
    @IBAction func lvlButtonPressed(_ sender: Any) {
        let lvlAlert = UIAlertController(title: "XP Needed to Level Up:", message: "\(levelUpXP - thisUser.currentXP)", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Ok", style: .default, handler: { (action) in lvlAlert.dismiss(animated: true, completion: nil)
        })
        lvlAlert.addAction(okayAction)
        present(lvlAlert, animated: true, completion: nil)
    
    }
    
    
    @IBAction func unwindToTask(unwindSegue: UIStoryboardSegue) {
    }
    override func viewWillAppear(_ animated: Bool) {
        taskTableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lvlOutlet.title = "Lvl: \(String(thisUser.level))"
        dailyTabBar.image = #imageLiteral(resourceName: "bed")
    }

}
