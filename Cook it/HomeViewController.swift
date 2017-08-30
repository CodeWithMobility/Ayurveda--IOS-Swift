//
//  ViewController.swift
//  Cook it
//
//  Created by mobile dev3 on 7/19/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit




class HomeViewController: BaseViewController {
   
    @IBOutlet weak var HomeMedicines: UIView!
    @IBOutlet weak var Treatments: UIView!
    @IBOutlet weak var showMap: UIView!
    @IBOutlet weak var Tips: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setNaviationBar(headLine: "HOME")
        HomeMedicines.cardView()
        Treatments.cardView()
        showMap.cardView()
        Tips.cardView()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        Tips.addGestureRecognizer(tapGesture)
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(handleTapPlant(sender:)))
        HomeMedicines.addGestureRecognizer(tapGesture2)
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(handleTapTreat(sender:)))
        Treatments.addGestureRecognizer(tapGesture3)
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(handleTapMap(sender:)))
        showMap.addGestureRecognizer(tapGesture4)
    }

   
    func handleTap(sender: UITapGestureRecognizer) {
        var qrCodeVC : TipsViewController!
        qrCodeVC  = self.storyboard!.instantiateViewController(withIdentifier: "TipsViewController") as! TipsViewController
        navigationController?.pushViewController(qrCodeVC, animated: false)
       
    }
    
    func handleTapPlant(sender: UITapGestureRecognizer) {
        var qrCodeVC : MedicinalPlantsViewController!
        qrCodeVC  = self.storyboard!.instantiateViewController(withIdentifier: "MedicinalPlantsViewController") as! MedicinalPlantsViewController
        navigationController?.pushViewController(qrCodeVC, animated: false)
        
    }
    
    func handleTapTreat(sender: UITapGestureRecognizer) {
        var qrCodeVC : TreatmentViewController!
        qrCodeVC  = self.storyboard!.instantiateViewController(withIdentifier: "TreatmentViewController") as! TreatmentViewController
        navigationController?.pushViewController(qrCodeVC, animated: false)
        
    }
    
    func handleTapMap(sender: UITapGestureRecognizer) {
        var qrCodeVC : ShowMapViewController!
        qrCodeVC  = self.storyboard!.instantiateViewController(withIdentifier: "ShowMapViewController") as! ShowMapViewController
        navigationController?.pushViewController(qrCodeVC, animated: false)
        
    }
}

