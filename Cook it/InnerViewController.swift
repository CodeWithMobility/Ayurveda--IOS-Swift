//
//  InnerViewController.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/11/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit

class InnerViewController: UIViewController {
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
         let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.height
        //Back buttion
        let btnLeftMenu: UIButton = UIButton()
        btnLeftMenu.setImage(UIImage(named: "back_icon"), for: UIControlState())
        btnLeftMenu.addTarget(self, action: #selector(InnerViewController.onClcikBack), for: UIControlEvents.touchUpInside)
       // btnLeftMenu.frame = CGRect(x: 0, y: 0, width: 33/2, height: 27/2)
         btnLeftMenu.frame = CGRect(x: 0, y: 0, width: 22, height: 22)
        let barButton = UIBarButtonItem(customView: btnLeftMenu)
        self.navigationItem.leftBarButtonItem = barButton
        
    }
    
    func onClcikBack()
    {
      _ = self.navigationController?.popViewController(animated: true)
       // self.navigationController?.popToRootViewController(animated: true)
    }
   
    
    
}
