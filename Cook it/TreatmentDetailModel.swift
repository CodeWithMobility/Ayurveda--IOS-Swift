//
//  TreatmentDetailModel.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/12/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import Foundation

struct TreatmentDetailModel {
    let treatment_name: String
    let id: String
    let treatment_description: String
    let treatment_advantage: String
    
    
    init(id: String, treatment_name: String, treatment_description: String, treatment_advantage: String){
        self.treatment_name =  treatment_name
        self.id = id
        self.treatment_description = treatment_description
        self.treatment_advantage = treatment_advantage
        
    }
}
