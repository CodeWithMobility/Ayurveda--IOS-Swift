//
//  TreatmentViewController.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/10/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit

class TreatmentViewController: InnerViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, NetworkManagerDelegate {
    
    let rest : NetworkManager = NetworkManager()
    var viewActivity = ProgressUtils()
    var arrayofData:[TreatmentModel] = [TreatmentModel]()
    let gridFlowLayout = GridFlowLayout()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNaviationBar(headLine: "TREATMENTS")
        rest.initwith()
        rest.restDelegate = self
        viewActivity.showActivityIndicator(self.view);
        rest.getContactDetails(Utils.TREATMENT_URL, userToken: ActivityConstants.INT_TREATMENTS)
        collectionView.collectionViewLayout = gridFlowLayout
        
    }
    
    
    // MARK: collectionView methods
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TreatMentCollectionViewCell", for: indexPath) as! TreatMentCollectionViewCell
        cell.backView.cardView()
        let myString = arrayofData[indexPath.row].treat
        cell.title.text = myString
        cell.image.setDownloadImage(80, height: 80, urlstr: Utils.IMAGEBASE_URL+arrayofData[indexPath.row].image)
        cell.layoutIfNeeded()
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var treatDetailsVC : TreatmentDetailsViewController!
        treatDetailsVC  = self.storyboard!.instantiateViewController(withIdentifier: "TreatmentDetailsViewController") as! TreatmentDetailsViewController
        treatDetailsVC.titleOfTreatment = arrayofData[indexPath.row].treat
        treatDetailsVC.imageNameofTreatment = arrayofData[indexPath.row].image
        navigationController?.pushViewController(treatDetailsVC, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayofData.count
    }
    
    
    func ApiResponsegetArrived(_ Response:AnyObject, Token:String){
        viewActivity.hideActivityIndicator()
        if(Token == ActivityConstants.INT_TREATMENTS){
            // print("Token is \(Token) And Response is \(Response)")
            if let blogs = Response["Treat"] as? [String: AnyObject] {
                if let detaialsjson = blogs["details"] as? [[String: AnyObject]] {
                    for blog in detaialsjson {
                        if let name = blog["treat"] as? String  {
                            //print(name)
                            let treatmentsItem = TreatmentModel(id: blog["id"] as! String, treat: blog["treat"] as! String, image: blog["image"] as! String)
                            self.arrayofData.append(treatmentsItem)
                            collectionView.reloadData()
                        }
                    }
                }
            }
        }
        
    }
    
    
    struct TreatmentModel {
        let id: String
        let treat: String
        let image: String
        
        init(id: String, treat: String, image: String){
            self.id =  id
            self.treat = treat
            self.image = image
        }
    }
    
    
}
