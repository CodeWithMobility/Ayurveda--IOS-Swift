//
//  HospitalDetailsViewController.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/11/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit
import GoogleMaps

class HospitalDetailsViewController: InnerViewController, GMSMapViewDelegate {
    
    var hospitalModel: HospitalModel?
    @IBOutlet weak var hospitalName: UILabel!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var pinLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var mapview: GMSMapView!
    var camera: GMSCameraPosition?    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNaviationBar(headLine: "HOSPITAL DETAILS")
        hospitalName.text = hospitalModel?.name
        placeName.text = hospitalModel?.place
        addressLabel.text = (hospitalModel?.district)! + " , " + (hospitalModel?.state)!
        pinLabel.text = hospitalModel?.pin
        phoneLabel.text = hospitalModel?.phone
        initializeMap()
        
    }
    
    
    func initializeMap() {
        mapview?.delegate = self
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: Double((hospitalModel?.latti.removingWhitespaces())!)!, longitude: Double((hospitalModel?.longi.removingWhitespaces())!)!)
        let target = CLLocationCoordinate2D(latitude: Double((hospitalModel?.latti.removingWhitespaces())!)!, longitude: Double((hospitalModel?.longi.removingWhitespaces())!)!)
        mapview.camera = GMSCameraPosition.camera(withTarget: target, zoom: 6)
        marker.map = mapview
    }
    
}
