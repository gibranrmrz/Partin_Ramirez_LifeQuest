//
//  BlueTableViewCell.swift
//  Partin_Ramirez_LifeQuest
//
//  Created by Gibran Ramirez on 2019-01-16.
//  Copyright © 2019 Gibran Ramirez. All rights reserved.
//

import UIKit

class BlueTableViewCell: UITableViewCell {

    @IBOutlet weak var peripheralNameLabel: UILabel!
    
    @IBOutlet weak var RSSILabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
