//
//  GFakeLaunchVC.swift
//  Gymnastics
//
//  Created by Squall on 7/31/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import UIKit

class GFakeLaunchVC: GBaseVC {

    @IBOutlet weak var tableView: UITableView!
    let menuItem:[String] = ["Thông tin cá nhân", "Dữ liệu ảnh", "Số đo cơ thể"]
    
    override func viewDidLoad() {
        addSlideMenuButton()
        super.viewDidLoad()
        self.perform(#selector(self.splashTimeOut(sender:)), with: nil, afterDelay: 3)
        tableView.registerCellNib(LeftMenuCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addSlideMenuButton(){
        let buttonShowMenu = UIButton(type: UIButtonType.system)
        buttonShowMenu.setImage(self.defaultMenuImage(), for: UIControlState())
        buttonShowMenu.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        buttonShowMenu.addTarget(self, action: #selector(onSlideMenuButtonPressed(_:)), for: UIControlEvents.touchUpInside)
        let customBarItem = UIBarButtonItem(customView: buttonShowMenu)
        self.navigationItem.leftBarButtonItem = customBarItem
    }
    
    func defaultMenuImage() -> UIImage{
        var defaultMenuImage = UIImage()
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 22), false,  0.0)
        
        UIColor.black.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 3, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 10, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 17, width: 30, height: 1)).fill()
        
        UIColor.white.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 4, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 11,  width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 18, width: 30, height: 1)).fill()
        
        defaultMenuImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        return defaultMenuImage;
    }
    
    @objc func onSlideMenuButtonPressed(_ sender: UIButton){
        print("lam gi bay h ?")
    }
    
    @objc func splashTimeOut(sender:Timer){
        GDelegate.startupProcess()
    }

}

extension GFakeLaunchVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let condition: LeftMenuItem = LeftMenuItem(rawValue: indexPath.row)!
        switch condition {
        case .BASIC_INFORMATION:
            var cell:LeftMenuCell? = tableView.dequeueReusableCell(withIdentifier: LeftMenuCell.typeName, for: indexPath) as? LeftMenuCell
            if !(cell != nil){
                cell = LeftMenuCell(style: .default, reuseIdentifier: LeftMenuCell.typeName)
            }
            cell?.cellName.text = menuItem[indexPath.row]
            cell?.onClickCell = {
                print("Basic Infor")
            }
            return cell!
        case .IMAGE:
            var cell:LeftMenuCell? = tableView.dequeueReusableCell(withIdentifier: LeftMenuCell.typeName, for: indexPath) as? LeftMenuCell
            if !(cell != nil){
                cell = LeftMenuCell(style: .default, reuseIdentifier: LeftMenuCell.typeName)
            }
            cell?.cellName.text = menuItem[indexPath.row]
            cell?.onClickCell = {
                print("Image")
            }
            return cell!
        case .BODY_ANALYSIS:
            var cell:LeftMenuCell? = tableView.dequeueReusableCell(withIdentifier: LeftMenuCell.typeName, for: indexPath) as? LeftMenuCell
            if !(cell != nil){
                cell = LeftMenuCell(style: .default, reuseIdentifier: LeftMenuCell.typeName)
            }
            cell?.cellName.text = menuItem[indexPath.row]
            cell?.onClickCell = {
                print("Body Analysis")
            }
            return cell!
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
