//
//  String.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/13/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import Foundation
extension String {
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}
