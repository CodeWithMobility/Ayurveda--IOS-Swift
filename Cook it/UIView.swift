//
//  UIView.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/30/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit

extension UIView {
    
    func cardView(){
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 4.0
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0.6
    }
}
