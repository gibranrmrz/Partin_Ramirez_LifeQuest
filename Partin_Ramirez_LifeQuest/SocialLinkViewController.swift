
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
    
    @IBOutlet weak var socialTableView: UITableView!
    
    // Table View  Stuff
    
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
        if blePeripheral == peripherals[indexPath.row] {
            currentXP += 500
        }
    }
    
    // Core Bluetooth stuff below
    
    func connectToDevice() {
        centralManager?.connect(blePeripheral!, options: nil)
        print(blePeripheral!)
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
