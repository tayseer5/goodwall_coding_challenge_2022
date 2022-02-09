//
//  MainLabel.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 29/01/2022.
//

import Foundation
import UIKit
// MARK: - HeaderLabel
@IBDesignable class HeaderLabel: UILabel {
    required init?(coder aDecoder:NSCoder) {
            super.init(coder:aDecoder)
        commanInit()
        }

        override init(frame:CGRect) {
            super.init(frame:frame)
            commanInit()
        }
    private func commanInit(){
        self.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        self.textColor = ThemeManager.currentTheme().titleTextColor
        
    }
}
// MARK: - MainLabel
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
// MARK: - SecoundyLabel
@IBDesignable class SecoundyLabel: UILabel {
    // for init view by storyboard
    required init?(coder aDecoder:NSCoder) {
            super.init(coder:aDecoder)
        commanInit()
        }
//for programatically initializing the view
        override init(frame:CGRect) {
            super.init(frame:frame)
            
            commanInit()
        }
    private func commanInit(){
        self.font = UIFont.systemFont(ofSize: 17)
        self.textColor = ThemeManager.currentTheme().subtitleTextColor
        
    }
}
// MARK: - DescriptionLabel
@IBDesignable class DescriptionLabel: UILabel {
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
        self.textColor = ThemeManager.currentTheme().titleTextColor
        
    }
}
