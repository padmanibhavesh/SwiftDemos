//
//  TableViewCell.swift
//  HitList
//
//  Created by Apple on 24/07/15.
//  Copyright (c) 2015 idroid. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var itemTitle:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
