//
//  LeftMenuCell.swift
//  Gymnastics
//
//  Created by Squall on 7/31/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import UIKit

class LeftMenuCell: UITableViewCell {

    @IBOutlet weak var cellName: UILabel!
    var onClickCell:(() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func actionPressCell(_ sender: Any) {
        onClickCell?()
    }
}
