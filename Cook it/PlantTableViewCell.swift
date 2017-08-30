//
//  PlantTableViewCell.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/9/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit

class PlantTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!    
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       containerView.cardView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
}
