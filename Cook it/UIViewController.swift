//
//  UIViewController.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/10/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//


import UIKit

extension UIViewController
{
    func setNaviationBar(headLine: String){
        self.navigationItem.title = headLine
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "Futura-Medium", size: 16)!,
            NSForegroundColorAttributeName: UIColor(hex: "378E1E")
        ]
    }
    
    
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    func setNavigationBarItem() {
      //  self.navigationController?.navigationBar.backItem?.title = ""
        
    }
    
    func backButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addBackbutton(title: String) {
        if let nav = self.navigationController,
            let item = nav.navigationBar.topItem {
            item.backBarButtonItem  = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.plain, target: self, action:
                #selector(self.backButtonAction))
        } else {
            if let nav = self.navigationController,
                let _ = nav.navigationBar.backItem {
                self.navigationController!.navigationBar.backItem!.title = title
            }
        }
    }
    
}
