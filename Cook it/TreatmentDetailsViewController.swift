//
//  TreatmentDetailsViewController.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/12/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit

class TreatmentDetailsViewController: InnerViewController , NetworkManagerDelegate {
    
    let rest : NetworkManager = NetworkManager()
    var viewActivity = ProgressUtils()
    var titleOfTreatment = String()
    var imageNameofTreatment = String()
    @IBOutlet weak var treatmentNameLabel: UILabel!
    @IBOutlet weak var advantagesLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    var arrayofData:[TreatmentDetailModel] = [TreatmentDetailModel]()
    @IBOutlet weak var hospitalListButton: UIButton!
    @IBOutlet weak var imageViewTreatment: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNaviationBar(headLine: "TREATMENTS DETAILS")
        rest.initwith()
        rest.restDelegate = self
        viewActivity.showActivityIndicator(self.view);
        hospitalListButton.cornerRadius(value: 20)
        rest.getContactDetails(Utils.TREATMENT_DETAIL_URL+"treatment="+titleOfTreatment, userToken: ActivityConstants.INT_TREATMENT_DETAILS)
        imageViewTreatment.setDownloadImage(80, height: 80, urlstr: Utils.IMAGEBASE_URL+imageNameofTreatment)
    }
    

    func ApiResponsegetArrived(_ Response:AnyObject, Token:String){
        viewActivity.hideActivityIndicator()
        if(Token == ActivityConstants.INT_TREATMENT_DETAILS){
            //print("Token is \(Token) And Response is \(Response)")
            if let treatmentDetails = Response["Treatment"] as? [String: AnyObject] {
                if let detaialsjson = treatmentDetails["detailes"] as? [[String: AnyObject]] {
                    for treatDetailBundle in detaialsjson {
                        if let name = treatDetailBundle["treatment_name"] as? String  {
                            print(name)
                            let treatmentsItem = TreatmentDetailModel(id: treatDetailBundle["id"] as! String, treatment_name: treatDetailBundle["treatment_name"] as! String, treatment_description: treatDetailBundle["treatment_description"] as! String, treatment_advantage: treatDetailBundle["treatment_advantage"] as! String )
                            self.arrayofData.append(treatmentsItem)
                           
                        }
                    }
                    
                    if(arrayofData.count > 0) {
                    infoLabel.text = arrayofData[0].treatment_description
                        advantagesLabel.text = arrayofData[0].treatment_advantage
                        treatmentNameLabel.text = arrayofData[0].treatment_name
                        let fullNameArr: [String] = arrayofData[0].treatment_advantage.components(separatedBy: "-")
                        
                        for points in fullNameArr {
                            print(points)
                        }
                    }
                }
            }
        }
    }
    
    
    
    @IBAction func hospitalListClick(_ sender: UIButton) {
        var hospitalListVC : HospitalListViewController!
        hospitalListVC  = self.storyboard!.instantiateViewController(withIdentifier: "HospitalListViewController") as! HospitalListViewController
        hospitalListVC.treatment = titleOfTreatment
        navigationController?.pushViewController(hospitalListVC, animated: false)
    }
}
