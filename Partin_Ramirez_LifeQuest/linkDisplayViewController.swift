//
//  linkDisplayViewController.swift
//  Partin_Ramirez_LifeQuest
//
//  Created by Period Three on 2019-01-18.
//  Copyright © 2019 Gibran Ramirez. All rights reserved.
//

import UIKit

class linkDisplayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //makes variables for the table view, level button, and the bar item
    @IBOutlet weak var linkTableView: UITableView!
    @IBOutlet weak var levelOutlet: UIBarButtonItem!
    @IBOutlet weak var linkBarItem: UITabBarItem!
    
    //makes a new cell, makes its row number equal to the number of registered social links, and makes the row titles equal to the social link names
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theLinkArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourCellsTest = tableView.dequeueReusableCell(withIdentifier: "linkCell1", for: indexPath)
        ourCellsTest.textLabel?.text = "\(theLinkArray[indexPath.row].name)"
        return ourCellsTest
    }
    
    //allows deleting
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        theLinkArray.remove(at: indexPath.row)
        linkTableView.deleteRows(at: [indexPath], with: .fade)
    }

    //takes the user to the bluetooth view controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToBluetooth", sender: self)
    }
    
    //tells the new item view controller it is creating a social link
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        num = 3
    }
    
    //adds a checkmark when a row is selected, adds the appropriate experience, and updates the level
    @IBAction func lvlTapped(_ sender: Any) {
        let lvlAlert = UIAlertController(title: "XP Needed to Level Up:", message: "\(levelUpXP - thisUser.currentXP)", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Ok", style: .default, handler: { (action) in lvlAlert.dismiss(animated: true, completion: nil)
        })
        lvlAlert.addAction(okayAction)
        present(lvlAlert, animated: true, completion: nil)
    }
    
    //unwind segue
    @IBAction func unwindToLink(unwindSegue: UIStoryboardSegue) {
    }
    
    //reloads the level button and table view when the view will appear
    override func viewWillAppear(_ animated: Bool) {
        levelOutlet.title = "Lvl: \(String(thisUser.level))"
        linkTableView.reloadData()
    }
    
    //updates the bar button when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        linkBarItem.image = #imageLiteral(resourceName: "friend")
    }
    
}
