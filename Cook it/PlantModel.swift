//
//  PlantModel.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/9/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import Foundation
struct PlantModel {
    let name: String
    let scientific: String
    let english: String
    let details: String
    let image: String
    let uses: String
    
    init(name: String, scientific: String, english: String, details: String, image: String, uses: String){
        self.name =  name
        self.scientific = scientific
        self.english = english
        self.details = details
        self.image = image
        self.uses = uses
    }
}
