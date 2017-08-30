//
//  ShowMapViewController.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/11/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit
import GoogleMaps

class ShowMapViewController: InnerViewController, NetworkManagerDelegate, GMSMapViewDelegate {

    let rest : NetworkManager = NetworkManager()
    var camera: GMSCameraPosition?,mapView:GMSMapView?
    var viewActivity = ProgressUtils()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNaviationBar()
      //  setNavigationBarItem()
        initializeMap()
        rest.initwith()
        rest.restDelegate = self
        // rest.getContactDetails(Utils.BASE_URL, userToken: ActivityConstants.INT_TIPS)
        rest.getContactDetails(Utils.HOSPITAL_URL, userToken: ActivityConstants.INT_HOSPITALS)
        viewActivity.showActivityIndicator(self.view);
    }
    func setNaviationBar(){
        self.navigationItem.title = "Show On Map"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "Futura-Medium", size: 16)!,
            NSForegroundColorAttributeName: UIColor(hex: "378E1E")
        ]
    }

    
    func initializeMap() {
       // GMSServices.provideAPIKey("AIzaSyBU59iHGy9vGdjoj_zkQY7k2Iks25LJaZw")
        camera = GMSCameraPosition.camera(withLatitude: 8.382399, longitude: 76.988373, zoom: 8.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera!)
        
        self.view = mapView
        mapView?.delegate = self
        
    }
    
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("infowindow tapped")
        var hosDetailsVC : HospitalDetailsViewController!
        hosDetailsVC  = self.storyboard!.instantiateViewController(withIdentifier: "HospitalDetailsViewController") as! HospitalDetailsViewController
       hosDetailsVC.hospitalModel = marker.userData as! HospitalModel?
        navigationController?.pushViewController(hosDetailsVC, animated: false)
    }
    func ApiResponsegetArrived(_ Response:AnyObject, Token:String){
        viewActivity.hideActivityIndicator()
        if(Token == ActivityConstants.INT_HOSPITALS){
            // print("Token is \(Token) And Response is \(Response)")
            if let blogs = Response["HospitalDetails"] as? [String: AnyObject] {
                if let detaialsjson = blogs["details"] as? [[String: AnyObject]] {
                    for blog in detaialsjson {
                        if let name = blog["name"] as? String  {
                            print(name)
                      
                            
                            let hostItem = HospitalModel(id: blog["id"] as! String, name: blog["name"] as! String, district: blog["district"] as! String, place: blog["place"] as! String, latti: blog["latti"] as! String, longi: blog["longi"] as! String, state: blog["state"] as! String, pin: blog["pin"] as! String, phone: blog["phone"] as! String, icon: blog["gallery"] as! String)
                            
                            let marker = GMSMarker()
                            marker.position = CLLocationCoordinate2D(latitude: Double(hostItem.latti.replacingOccurrences(of: " ", with: ""))!, longitude: Double(hostItem.longi)!)
                            marker.title = hostItem.place
                            marker.snippet = hostItem.name
                            marker.icon = UIImage(named: "pin")
                            marker.map = mapView;
                            marker.userData = hostItem
                            
                        }
                    }
                }
            }
            
        }
        
    }
    

}
