//
//  MedicinalPlantsViewController.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/9/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit

class MedicinalPlantsViewController: InnerViewController,UITableViewDelegate, UITableViewDataSource, NetworkManagerDelegate {
    
    let rest : NetworkManager = NetworkManager()
    var viewActivity = ProgressUtils()
    var arrayofData:[PlantModel] = [PlantModel]()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNaviationBar(headLine: "MEDICINAL")
        //setNavigationBarItem()
        rest.initwith()
        rest.restDelegate = self
        viewActivity.showActivityIndicator(self.view);
         self.tableView.separatorStyle = .none
        rest.getContactDetails(Utils.PLANTS_URLS, userToken: ActivityConstants.INT_PLANTS)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection numberOfRows: Int) -> Int {
        return arrayofData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlantTableViewCell", for: indexPath as IndexPath) as! PlantTableViewCell
        cell.selectionStyle = .none
        cell.title.text = arrayofData[indexPath.row].english
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var plantDetailsVC : PlantDetailsUIViewController!
        plantDetailsVC  = self.storyboard!.instantiateViewController(withIdentifier: "PlantDetailsUIViewController") as! PlantDetailsUIViewController
        plantDetailsVC.plantsModel = arrayofData[indexPath.row]
        navigationController?.pushViewController(plantDetailsVC, animated: false)
        
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        if viewHasMovedToTop {
            let transform = CATransform3DTranslate(CATransform3DIdentity, 0, 400, 0)
            cell.layer.transform = transform
            
        }else {
            let transform = CATransform3DTranslate(CATransform3DIdentity, 0, -400, 0)
            cell.layer.transform = transform
        }
        
        UIView.animate(withDuration: 1){
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
        
    }
    
    var lastContentOffset: CGFloat = 0
    var viewHasMovedToTop = false
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.lastContentOffset < scrollView.contentOffset.y) {
            viewHasMovedToTop = true
        } else if (self.lastContentOffset > scrollView.contentOffset.y) {
            viewHasMovedToTop = false
        } else {
        }
    }
    
    func ApiResponsegetArrived(_ Response:AnyObject, Token:String){
        viewActivity.hideActivityIndicator()
        if(Token == ActivityConstants.INT_PLANTS){
            // print("Token is \(Token) And Response is \(Response)")
            if let blogs = Response["AddressDetails"] as? [String: AnyObject] {
                if let detaialsjson = blogs["details"] as? [[String: AnyObject]] {
                    for blog in detaialsjson {
                        if let name = blog["name"] as? String  {                          
                            
                            let plantsItem = PlantModel(name: blog["name"] as! String, scientific: blog["scientific"] as! String, english: blog["english"] as! String, details: blog["details"] as! String, image: blog["image"] as! String, uses: blog["uses"] as! String)
                            self.arrayofData.append(plantsItem)
                            //filteredData = arrayofData
                            tableView.reloadData()
                        }
                    }
                }
            }
            
        }
        
    }
  
}
