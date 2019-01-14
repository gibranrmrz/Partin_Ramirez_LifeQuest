//
//  dailyTaskViewController.swift
//  Partin_Ramirez_LifeQuest
//
//  Created by Period Three on 2019-01-14.
//  Copyright © 2019 Gibran Ramirez. All rights reserved.
//

import UIKit

class dailyTaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var taskArray: [Task] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourCellsTest = tableView.dequeueReusableCell(withIdentifier: "taskCell1", for: indexPath)
        ourCellsTest.textLabel?.text = "\(taskArray[indexPath.row].title)"
        return ourCellsTest
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
