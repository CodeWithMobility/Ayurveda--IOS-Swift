//
//  PlantDetailsUIViewController.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/9/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit

class PlantDetailsUIViewController: InnerViewController {
    
    var plantsModel: PlantModel?    
    @IBOutlet weak var usedetailsLbl: UILabel!
    @IBOutlet weak var imagePlant: UIImageView!
    @IBOutlet weak var descriptionContent: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNaviationBar(headLine: (plantsModel?.english)!)
        descriptionContent.text = plantsModel?.details
        imagePlant.setDownloadImage(80, height: 80, urlstr: Utils.IMAGEPLANT_URL+(plantsModel?.image)!)
        usedetailsLbl.text = plantsModel?.uses
    }
    
    
}
