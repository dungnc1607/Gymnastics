//
//  GBaseVC.swift
//  Gymnastics
//
//  Created by Squall on 7/26/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import Foundation
import UIKit

class GBaseVC: UIViewController, GNavigationVMProtocol {
    
    var vmNavigation: GNavigationVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        vmNavigation = GNavigationVM(self)
    }
    
    func open(vc: GBaseVC) {
        navigationController?.pushViewController(vc, animated: true )
    }
    
    func close(toRoot: Bool) {
        if toRoot{
            navigationController?.popToRootViewController(animated: true)
        }else{
            navigationController?.popViewController(animated: true)
        }
    }
    
    func closeToVC(_ vc: GBaseVC) {
        navigationController?.popToViewController(vc, animated: true)
    }
    
}
