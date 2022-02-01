//
//  TagCollectionViewCell.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 30/01/2022.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tagLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.borderWidth = 2
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = self.frame.size.width / 15
        contentView.layer.borderColor = UIColor.black.cgColor
        // Initialization code
    }

}
