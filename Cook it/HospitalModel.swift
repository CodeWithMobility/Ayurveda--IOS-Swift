//
//  HospitalModel.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/11/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import Foundation

struct HospitalModel {
    let name: String
    let id: String
    let place: String
    let district: String
    let state: String
    let latti: String
    let longi: String
    let pin: String
    let phone: String
    let icon: String
    
    init(id: String, name: String, district: String, place: String, latti: String, longi: String, state: String, pin: String, phone: String,  icon: String){
        self.name =  name
        self.id = id
        self.place = place
        self.district = district
        self.latti = latti
        self.longi = longi
         self.state = state
         self.pin = pin
         self.phone = phone
        self.icon = icon
    }
}
