//
//  TableViewCell.swift
//  PlayerApp
//
//  Created by Apple on 29/07/15.
//  Copyright (c) 2015 idroid. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var lblSongTitle: UILabel!
    @IBOutlet var lblSongAlbum: UILabel!
    @IBOutlet var songImgView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
