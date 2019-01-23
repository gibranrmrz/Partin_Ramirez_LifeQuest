//
//  linkDisplayViewController.swift
//  Partin_Ramirez_LifeQuest
//
//  Created by Period Three on 2019-01-18.
//  Copyright © 2019 Gibran Ramirez. All rights reserved.
//

import UIKit

class linkDisplayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var linkTableView: UITableView!
    @IBOutlet weak var levelOutlet: UIBarButtonItem!
    
    @IBOutlet weak var linkBarItem: UITabBarItem!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theLinkArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourCellsTest = tableView.dequeueReusableCell(withIdentifier: "linkCell1", for: indexPath)
        ourCellsTest.textLabel?.text = "\(theLinkArray[indexPath.row].name)"
        return ourCellsTest
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        levelOutlet.title = "Lvl: \(String(thisUser.level))"
        linkBarItem.image = #imageLiteral(resourceName: "friend")
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        theLinkArray.remove(at: indexPath.row)
        linkTableView.deleteRows(at: [indexPath], with: .fade)
        
        //saveData()
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToBluetooth", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        num = 3
    }
    @IBAction func unwindToLink(unwindSegue: UIStoryboardSegue) {}
    override func viewWillAppear(_ animated: Bool) {
        levelOutlet.title = "Lvl: \(String(thisUser.level))"
        linkTableView.reloadData()
    }
   
    @IBAction func lvlTapped(_ sender: Any) {
    
        let lvlAlert = UIAlertController(title: "XP Needed to Level Up:", message: "\(levelUpXP - thisUser.currentXP)", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Ok", style: .default, handler: { (action) in lvlAlert.dismiss(animated: true, completion: nil)
        })
        lvlAlert.addAction(okayAction)
        present(lvlAlert, animated: true, completion: nil)
    }
    
    
}
