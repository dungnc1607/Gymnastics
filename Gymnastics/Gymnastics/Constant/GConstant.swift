//
//  GConstant.swift
//  Gymnastics
//
//  Created by Squall on 7/30/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import Foundation
import UIKit

class GConstant: NSObject {
    
}

let selectedColor = UIColor(hex: "1b59ff")
let unselectedColor = UIColor(hex: "000000")
let keyFont = UIFont(name: "Arial", size: 13)

let normalAtrributes = [NSAttributedStringKey.font: keyFont, NSAttributedStringKey.foregroundColor: unselectedColor]
let selectedAttributes = [NSAttributedStringKey.font: keyFont, NSAttributedStringKey.foregroundColor: selectedColor]
