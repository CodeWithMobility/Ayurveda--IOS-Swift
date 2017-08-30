//
//  TipsViewController.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/8/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit

class TipsViewController: InnerViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, NetworkManagerDelegate, UISearchResultsUpdating {
    
    @IBOutlet weak var tableView: UITableView!
    var arrayofData:[TipsModel] = [TipsModel]()
    var filteredCakes :[TipsModel] = [TipsModel]()
    let searchController = UISearchController(searchResultsController: nil)
    let rest : NetworkManager = NetworkManager()
    var viewActivity = ProgressUtils()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNaviationBar(headLine: "TIPS")
        rest.initwith()
        rest.restDelegate = self
        viewActivity.showActivityIndicator(self.view);
        self.tableView.separatorStyle = .none
        rest.getContactDetails(Utils.BASE_URL, userToken: ActivityConstants.INT_TIPS)
        
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchResultsUpdater = self
        // 3
        searchController.hidesNavigationBarDuringPresentation = false
        // 4
        searchController.dimsBackgroundDuringPresentation = false
        // 5
        searchController.searchBar.searchBarStyle = UISearchBarStyle.prominent
        // 6
        searchController.searchBar.sizeToFit()
        // 7
        self.tableView.tableHeaderView = searchController.searchBar
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        // If we haven't typed anything into the search bar then do not filter the results
        if searchController.searchBar.text! == "" {
            filteredCakes = arrayofData
        } else {
            // Filter the results
            filteredCakes = arrayofData.filter { $0.disease.lowercased().contains(searchController.searchBar.text!.lowercased()) }
        }
        
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection numberOfRows: Int) -> Int {
        return filteredCakes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TipTableViewCell", for: indexPath as IndexPath) as! TipTableViewCell
        cell.tipTitle.text = filteredCakes[indexPath.row].disease
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var qrCodeVC : TipDetailsViewController!
        qrCodeVC  = self.storyboard!.instantiateViewController(withIdentifier: "TipDetailsViewController") as! TipDetailsViewController
        qrCodeVC.tipsModel = filteredCakes[indexPath.row]
        navigationController?.pushViewController(qrCodeVC, animated: false)
        
    }
    
//    
//    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.alpha = 0
//        if viewHasMovedToTop {
//            let transform = CATransform3DTranslate(CATransform3DIdentity, 0, 400, 0)
//            cell.layer.transform = transform
//            
//        }else {
//            let transform = CATransform3DTranslate(CATransform3DIdentity, 0, -400, 0)
//            cell.layer.transform = transform
//        }
//        
//        UIView.animate(withDuration: 1){
//            cell.alpha = 1.0
//            cell.layer.transform = CATransform3DIdentity
//        }
//        
//    }
    
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
        if let blogs = Response["AddressDetails"] as? [String: AnyObject] {
            if let detaialsjson = blogs["details"] as? [[String: AnyObject]] {
                for blog in detaialsjson {
                    if let name = blog["diseases"] as? String  {
                        print(name)
                        let tipsItem = TipsModel(disease: blog["diseases"] as! String, remedy: blog["remedies"] as! String)
                        self.arrayofData.append(tipsItem)
                        filteredCakes = arrayofData
                        tableView.reloadData()                        }
                }
            }
        }
        
    }
    
    
}
