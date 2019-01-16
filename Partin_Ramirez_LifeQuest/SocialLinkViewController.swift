//
//  SocialLinkViewController.swift
//  Partin_Ramirez_LifeQuest
//
//  Created by Gibran Ramirez on 2019-01-15.
//  Copyright © 2019 Gibran Ramirez. All rights reserved.
//

import UIKit
import CoreBluetooth

var blePeripheral: CBPeripheral?

class SocialLinkViewController: UIViewController, UITableViewDelegate, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    var centralManager: CBCentralManager?
    var RSSIs = [NSNumber]()
    var peripherals = [CBPeripheral]()
    var peripheralUUIDsFound = NSMutableSet()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
   // func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //return
    //}
    
    func connectToDevice() {
        centralManager?.connect(blePeripheral!, options: nil)
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if let name = peripheral.name {
            print(print("Peripheral Name: \(name)"))
        }
        print("Peripheral UUID: \(peripheral.identifier.uuidString)")
        print("Peripheral RSSI: \(RSSI)")
        print("Ad Data: \(advertisementData)")
        
        print("**********")
        self.peripherals.append(peripheral)
        self.RSSIs.append(RSSI)
        peripheral.delegate = self
        blePeripheral = peripheral
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            //If bluetooh is working
            central.scanForPeripherals(withServices: nil, options: nil)
            
        } else {
       //If bluetooth is not working
            let alertVC = UIAlertController(title: "Bluetooth isn't Working", message: "Make sure bluetooth is on", preferredStyle: .alert)
           let okAction = UIAlertAction(title: "Ok", style: .default, handler: { (action) in alertVC.dismiss(animated: true, completion: nil)
           })
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
    }

}
