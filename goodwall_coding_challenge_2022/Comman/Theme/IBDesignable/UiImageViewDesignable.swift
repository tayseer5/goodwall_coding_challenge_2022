//
//  UiImageViewDesignable.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 29/01/2022.
//

import Foundation
import UIKit

@IBDesignable class IconImage: UIImageView {
    required init?(coder aDecoder:NSCoder) {
            super.init(coder:aDecoder)
        commanInit()
        }

        override init(frame:CGRect) {
            super.init(frame:frame)
            commanInit()
        }
    private func commanInit(){
        self.tintColor = UIColor.black
        
    }
}
