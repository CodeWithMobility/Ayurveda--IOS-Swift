//
//  ShareViewController.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/11/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit

class ShareViewController: BaseViewController {


    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googlePlusButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNaviationBar(headLine: "SHARE")
        facebookButton.cornerRadius(value: 10)
         googlePlusButton.cornerRadius(value: 10)
         twitterButton.cornerRadius(value: 10)
    }

    

}
