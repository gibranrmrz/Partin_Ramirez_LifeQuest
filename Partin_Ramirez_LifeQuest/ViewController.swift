
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var viewOutlet: UIView!
    
    
    @IBAction func startPressed(_ sender: UIButton) {
    }
    

   
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewOutlet.alpha = 0.0
        self.viewOutlet.layer.cornerRadius = 5.0
        if self.viewOutlet.alpha == 0.0 {
            //Show fade in animation
            UIView.animate(withDuration: 1.5, delay: 0.2, options: .curveEaseOut, animations: {
                self.viewOutlet.alpha = 1.0
            })
        } else {
            // hide with fade out
            UIView.animate(withDuration: 1.5, delay: 0.2, options: .curveEaseOut, animations: {
                self.viewOutlet.alpha = 1.0
            })
        }
    }


}

