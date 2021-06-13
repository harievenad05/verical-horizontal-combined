//
//  PrimaryCategoryCell.swift
//  mockstore
//
//  Created by Harie Venad on 13/06/21.
//  Copyright © 2021 Harie. All rights reserved.
//

import UIKit

class PrimaryCategoryCell: UICollectionViewCell {
    
    static let identifier = "PrimaryCategoryCell"
    static func nib() -> UINib{
        return UINib(nibName: "PrimaryCategoryCell", bundle: nil)
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        backgroundColor = UIColor.red
    }

}
