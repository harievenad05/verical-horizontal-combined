//
//  GroupTableCell.swift
//  mockstore
//
//  Created by Harie Venad on 13/06/21.
//  Copyright © 2021 Harie. All rights reserved.
//

import UIKit

class GroupTableCell: UITableViewCell {
    
    static let identifier = "GroupTableCell"
    static func nib() -> UINib{
        return UINib(nibName: "GroupTableCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        backgroundColor = UIColor.red
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
