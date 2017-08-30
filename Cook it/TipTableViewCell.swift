//
//  TipTableViewCell.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/8/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit

class TipTableViewCell: UITableViewCell {


    @IBOutlet weak var backgroundCardView: UIView!
    
    @IBOutlet weak var tipTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundCardView.cardView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
