//
//  linkDisplayViewController.swift
//  Partin_Ramirez_LifeQuest
//
//  Created by Period Three on 2019-01-18.
//  Copyright © 2019 Gibran Ramirez. All rights reserved.
//

import UIKit

class linkDisplayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
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

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType != UITableViewCell.AccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        num = 3
    }
    @IBAction func unwindToLink(unwindSegue: UIStoryboardSegue) {}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
