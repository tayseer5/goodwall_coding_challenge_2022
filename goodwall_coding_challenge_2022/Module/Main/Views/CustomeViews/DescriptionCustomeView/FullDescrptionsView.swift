//
//  FullDescrptionsView.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 30/01/2022.
//

import UIKit

class FullDescrptionsView: UIView {
    // MARK: - IBOutlet
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: HeaderLabel!
    @IBOutlet weak var summeryDescrptionsLabel: DescriptionLabel!
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
       Bundle.main.loadNibNamed("FullDescrptionsView", owner: self, options: nil)
        contentView.fixInView(self)
        
    }
    
}
