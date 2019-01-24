
import UIKit
import CoreBluetooth

var blePeripheral: CBPeripheral?
var names: [String] = []
var RSSIs: [NSNumber] = []


class SocialLinkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    // Variables needed to do Core Bluetooth
    var centralManager: CBCentralManager?
    var RSSIs = [NSNumber]()
    var peripherals = [CBPeripheral]()
    var peripheralUUIDsFound = NSMutableSet()
    
    @IBOutlet weak var socialTableView: UITableView!
    
    // Table View  Stuff
    
    // Show a number of rows depending on many Bluetooth devices are found
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    // Displays the names of the devices in table view cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BlueCell", for: indexPath) as? BlueTableViewCell {
            cell.peripheralNameLabel.text = names[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    // When a device is selected in the table view connect to it and gain a level (500XP)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        blePeripheral = peripherals[indexPath.row]
        connectToDevice()
        if blePeripheral == peripherals[indexPath.row] {
            levelUp(gained: 500)
        }
    }
    
    // Core Bluetooth stuff below
    
    // function to connnect to a device and show an alert
    func connectToDevice() {
        centralManager?.connect(blePeripheral!, options: nil)
        print(blePeripheral!)
        let connectAlert = UIAlertController(title: "Connected!", message: "Awarded 500XP", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in connectAlert.dismiss(animated: true, completion: nil)
        })
     connectAlert.addAction(okayAction)
        present(connectAlert, animated: true, completion: nil)
    }
    
    // Find
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if let name = peripheral.name {
            names.append(name)
        } else {
            names.append(peripheral.identifier.uuidString)
        }
        RSSIs.append(RSSI)
        peripherals.append(peripheral)
        socialTableView.reloadData()
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            // If bluetooth is working
            startScan()
            
        } else {
       // If bluetooth is not working
            let alertVC = UIAlertController(title: "Bluetooth isn't Working", message: "Make sure bluetooth is on", preferredStyle: .alert)
           let okAction = UIAlertAction(title: "Ok", style: .default, handler: { (action) in alertVC.dismiss(animated: true, completion: nil)
           })
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func DoneTapped(_ sender: Any) {
        if let safeblePeripheral = blePeripheral {
            centralManager?.cancelPeripheralConnection(safeblePeripheral)
            print(safeblePeripheral)
        }
        performSegue(withIdentifier: "unwindToLink", sender: self)
    }
    
    @IBAction func refreshTapped(_ sender: Any) {
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
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
    }

}
