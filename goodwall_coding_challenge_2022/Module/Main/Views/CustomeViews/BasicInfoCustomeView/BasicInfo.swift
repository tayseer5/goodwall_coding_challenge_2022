//
//  BasicInfo.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 28/01/2022.
//

import UIKit

class BasicInfo: UIView {
    // MARK: - IBOutLet
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainLabel: MainLabel!
    @IBOutlet weak var secondaryLabel: SecoundyLabel!
    @IBOutlet weak var firstIcon: IconImage!
    @IBOutlet weak var secoundIcon: IconImage!
    @IBOutlet weak var extraLabel: SecoundyLabel!
    // MARK: - Init
    override init(frame: CGRect) {//constructor for programmatically init
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {//Whenever contents of a nib file are unarchived, system calls this initializer.
        super.init(coder: coder)
        commonInit()
    }
    func commonInit(){
       Bundle.main.loadNibNamed("BasicInfoView", owner: self, options: nil)
        mainImage.roundedImage(borderColor: UIColor.yellow, cornerRadius: nil)
        contentView.fixInView(self)
    }
}
