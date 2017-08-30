//
//  UIButton.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/11/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit
extension UIButton {
    func cornerRadius(value: CGFloat) {
        self.layer.cornerRadius = value
        self.layer.borderWidth = 0.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.masksToBounds = true
    }}
