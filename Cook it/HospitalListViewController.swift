//
//  HospitalListViewController.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/13/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit

class HospitalListViewController: InnerViewController,  NetworkManagerDelegate, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    let rest : NetworkManager = NetworkManager()
    var viewActivity = ProgressUtils()
    var treatment : String!
    var arrayofData:[HospitalModel] = [HospitalModel]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNaviationBar(headLine: "HOSPITAL LIST")
        rest.initwith()
        rest.restDelegate = self
        viewActivity.showActivityIndicator(self.view);
        rest.getContactDetails(Utils.HOSPITAL_TREATMENTS_URL+"treatment="+treatment, userToken: ActivityConstants.INT_HOSPITAL_LIST)
    }
    
    
    func ApiResponsegetArrived(_ Response:AnyObject, Token:String){
        viewActivity.hideActivityIndicator()
        if(Token == ActivityConstants.INT_HOSPITAL_LIST){
            //  print("Token is \(Token) And Response is \(Response)")
            if let blogs = Response["aurveeda"] as? [String: AnyObject] {
                if let detaialsjson = blogs["detailes"] as? [[String: AnyObject]] {
                    for blog in detaialsjson {
                        if let name = blog["name"] as? String  {
                            print(name)
                            let hostItem = HospitalModel(id: blog["id"] as! String, name: blog["name"] as! String, district: blog["district"] as! String, place: blog["place"] as! String, latti: blog["latti"] as! String, longi: blog["longi"] as! String, state: blog["state"] as! String, pin: blog["pin"] as! String, phone: blog["phone"] as! String, icon: blog["gallery"] as! String)
                            
                            self.arrayofData.append(hostItem)
                            tableView.reloadData()
                            
                        }
                    }
                }
            }
            
        }
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection numberOfRows: Int) -> Int {
        return arrayofData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HospitalTableViewCell", for: indexPath as IndexPath) as! HospitalTableViewCell
        cell.nameHospital.text = arrayofData[indexPath.row].name
        cell.placeLabel.text =  arrayofData[indexPath.row].place+", "+arrayofData[indexPath.row].district
        cell.pinLabel.text = "Pin: "+arrayofData[indexPath.row].pin
        cell.phoneLabel.text = "Phone: "+arrayofData[indexPath.row].phone
        cell.imageViewIcon.setDownloadImage(80, height: 80, urlstr: Utils.HOSPITAL_IMAGE+(arrayofData[indexPath.row].icon))
        return cell
    }    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var hosDetailsVC : HospitalDetailsViewController!
        hosDetailsVC  = self.storyboard!.instantiateViewController(withIdentifier: "HospitalDetailsViewController") as! HospitalDetailsViewController
        hosDetailsVC.hospitalModel = arrayofData[indexPath.row]
        navigationController?.pushViewController(hosDetailsVC, animated: false)
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
    
    
    
}
