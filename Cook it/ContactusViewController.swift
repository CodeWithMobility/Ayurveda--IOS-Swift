//
//  ContactusViewController.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/11/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit

class ContactusViewController: BaseViewController {
    
    @IBOutlet weak var titleTV: UITextField!
    @IBOutlet weak var emailTV: UITextField!
    @IBOutlet weak var subjectTV: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNaviationBar(headLine: "FEEDBACK")
        submitButton.cornerRadius(value: 10)
    }

}
