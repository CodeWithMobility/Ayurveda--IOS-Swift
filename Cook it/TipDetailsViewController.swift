//
//  TipDetailsViewController.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/8/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit

class TipDetailsViewController: InnerViewController {
    
    @IBOutlet weak var scrollview: UIScrollView!
    var tipsModel: TipsModel?
    @IBOutlet weak var remediesDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNaviationBar(headLine: (tipsModel?.disease)!)
        remediesDescription.text = tipsModel?.remedy
        
    }
    
    
}
