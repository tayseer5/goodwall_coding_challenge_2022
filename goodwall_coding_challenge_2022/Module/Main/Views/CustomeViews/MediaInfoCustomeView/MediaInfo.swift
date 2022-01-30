//
//  MediaInfo.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 29/01/2022.
//

import UIKit

class MediaInfo: UIView {
    // MARK: - IBOutlet
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var achivmentView: UIView!
    @IBOutlet weak var mediaSlider: PhotoSliderView!
    @IBOutlet weak var achivmetTitle: UILabel!
    @IBOutlet weak var achivmentImage: UIImageView!
    // MARK: - init
    override init(frame: CGRect) {//constructor for programmatically init
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {//Whenever contents of a nib file are unarchived, system calls this initializer.
        super.init(coder: coder)
        commonInit()
    }
    func commonInit(){
       Bundle.main.loadNibNamed("MediaInfo", owner: self, options: nil)
        achivmetTitle.textColor = .white
        achivmentImage.backgroundColor = ThemeManager.currentTheme().secondaryColor
        contentView.fixInView(self)
    }
    
}
