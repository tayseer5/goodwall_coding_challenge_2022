//
//  MainLabel.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 29/01/2022.
//

import Foundation
import UIKit

@IBDesignable class MainLabel: UILabel {
    required init?(coder aDecoder:NSCoder) {
            super.init(coder:aDecoder)
        commanInit()
        }

        override init(frame:CGRect) {
            super.init(frame:frame)
            commanInit()
        }
    private func commanInit(){
        self.font = UIFont.boldSystemFont(ofSize: 17)
        self.textColor = ThemeManager.currentTheme().titleTextColor
        
    }
}
@IBDesignable class SecoundyLabel: UILabel {
    required init?(coder aDecoder:NSCoder) {
            super.init(coder:aDecoder)
        commanInit()
        }

        override init(frame:CGRect) {
            super.init(frame:frame)
            commanInit()
        }
    private func commanInit(){
        self.font = UIFont.systemFont(ofSize: 17)
        self.textColor = ThemeManager.currentTheme().subtitleTextColor
        
    }
}
