//
//  GNavigationVM.swift
//  Gymnastics
//
//  Created by Squall on 7/26/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import Foundation

protocol GNavigationVMProtocol {
    func open(vc: GBaseVC)
    func close(toRoot: Bool)
    func closeToVC(_ vc: GBaseVC)
}

class GNavigationVM: GBaseVM {
    
}
