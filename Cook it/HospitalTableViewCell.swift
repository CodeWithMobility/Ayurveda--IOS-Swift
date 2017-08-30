//
//  HospitalTableViewCell.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/13/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit

class HospitalTableViewCell: UITableViewCell {

    @IBOutlet weak var nameHospital: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var pinLabel: UILabel!    
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
