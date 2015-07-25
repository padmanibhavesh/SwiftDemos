//
//  TableViewCell.swift
//  ToDos
//
//  Created by Apple on 25/07/15.
//  Copyright (c) 2015 idroid. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet var itemTitle: UILabel!
    @IBOutlet var itemDescription: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var currentDate: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
