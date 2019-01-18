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
//let iPhoneServiceCBUUID = CBUUID(string: "6622B0F9960369649A124F844E0DAB31C91BCB0B")
var names: [String] = []
var RSSIs: [NSNumber] = []


class SocialLinkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    var centralManager: CBCentralManager?
    var RSSIs = [NSNumber]()
    var peripherals = [CBPeripheral]()
    var peripheralUUIDsFound = NSMutableSet()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BlueCell", for: indexPath) as? BlueTableViewCell {
            cell.peripheralNameLabel.text = names[indexPath.row]
            cell.RSSILabel.text = "RSSI: \(RSSIs[indexPath.row])"
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        blePeripheral = peripherals[indexPath.row]
        connectToDevice()
    }
    
    // Core Bluetooth stuff below
    
    func connectToDevice() {
        centralManager?.connect(blePeripheral!, options: nil)
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if let name = peripheral.name {
            names.append(name)
        } else {
            names.append(peripheral.identifier.uuidString)
        }
        RSSIs.append(RSSI)
        peripherals.append(peripheral)
        /*if peripherals.isEmpty == false {
            print(peripherals)
        }*/
        socialTableView.reloadData()
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            //If bluetooth is working
            startScan()
            
        } else {
       //If bluetooth is not working
            let alertVC = UIAlertController(title: "Bluetooth isn't Working", message: "Make sure bluetooth is on", preferredStyle: .alert)
           let okAction = UIAlertAction(title: "Ok", style: .default, handler: { (action) in alertVC.dismiss(animated: true, completion: nil)
           })
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func refreshTapped(_ sender: Any) {
    //socialTableView.reloadData()
    startScan()
    }
    
    func startScan() {
        names = []
        RSSIs = []
        peripherals = []
        socialTableView.reloadData()
        centralManager?.stopScan()
        centralManager?.scanForPeripherals(withServices: nil, options: nil)
    }
    
    @IBOutlet weak var socialTableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        num = 3
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
    }

}
