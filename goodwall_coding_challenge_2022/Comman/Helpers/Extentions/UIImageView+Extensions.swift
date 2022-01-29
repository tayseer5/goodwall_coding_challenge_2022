//
//  UIImageView+Extensions.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 28/01/2022.
//

import UIKit
import Kingfisher

extension UIImageView {
    //extention function for load image from url using kingfisher with base url of image by defult
    func loadImageFrom(baseUrl: String = Constant.IMAGE_URL ,url:String) {
        let url = URL(string: baseUrl + url)
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: "goodWallPlaceHolder"),
            options: [
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
    //rounde image by defult will be circle unless there was extra info send
    func roundedImage(borderColor: UIColor = UIColor.clear ,borderWidth: Int = 1 , cornerRadius: CGFloat?){
        self.layer.cornerRadius = cornerRadius ?? self.frame.size.width / 2.5
        self.clipsToBounds = true
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = CGFloat(borderWidth)
    }
}
