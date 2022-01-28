//
//  UIImageView+Extensions.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 28/01/2022.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadImageFrom(url:String) {
        let url = URL(string: Constant.IMAGE_URL + url)
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: "goodWallPlaceHolder"),
            options: [
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
}
