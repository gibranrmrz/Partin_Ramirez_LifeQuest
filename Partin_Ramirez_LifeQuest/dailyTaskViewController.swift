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
    
    var taskArray: [Int] = [0, 1]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourCellsTest = tableView.dequeueReusableCell(withIdentifier: "dailyCell1", for: indexPath)
        ourCellsTest.textLabel?.text = "\(taskArray[indexPath.row])"
        return ourCellsTest
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType != UITableViewCell.AccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        num = 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //taskTableView.isEditing = true
        // Do any additional setup after loading the view.
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
