//
//  GBaseVM.swift
//  Gymnastics
//
//  Created by Squall on 7/26/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import Foundation

class GBaseVM: NSObject {
    weak var ownerView: GBaseVC?
    
    init(_ ownerView: GBaseVC){
        self.ownerView = ownerView
    }
}
