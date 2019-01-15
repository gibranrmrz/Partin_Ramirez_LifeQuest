//
//  SocialLinkViewController.swift
//  Partin_Ramirez_LifeQuest
//
//  Created by Gibran Ramirez on 2019-01-15.
//  Copyright © 2019 Gibran Ramirez. All rights reserved.
//

import UIKit
import CoreBluetooth


class SocialLinkViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CBCentralManagerDelegate {
    
    var centralManager: CBCentralManager?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            
        } else {
       let alertVC = UIAlertController(title: "Bluetooth isn't Working", message: "Make sure bluetooth is on", preferredStyle: .alert)
           let okAction = UIAlertAction(title: "Ok", style: .default, handler: { (action) in alertVC.dismiss(animated: true, completion: nil)
           })
            alertVC.addAction(okAction)
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
    }

}
