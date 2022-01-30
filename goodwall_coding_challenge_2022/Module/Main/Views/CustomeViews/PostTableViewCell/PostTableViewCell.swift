//
//  PostTableViewCell.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 30/01/2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet weak var basicInfoView: BasicInfo!
    @IBOutlet weak var mediaInfoView: MediaInfo!
    @IBOutlet weak var fullDescriptionView: FullDescrptionsView!
    // MARK: - Varibles
    public var post: Post?{
        didSet {
            handlingUI()
        }
    }
    // MARK: - override functions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // MARK: - handling design functions
    func handlingUI () {
        handlingBasicInfoView()
    }
    func handlingBasicInfoView () {
        basicInfoView.mainImage.loadImageFrom(url: post?.item?.author?.picture ?? "")
        basicInfoView.mainLabel.text = post?.item?.author?.displayName
        basicInfoView.secondaryLabel.text = post?.item?.author?.location.area
        basicInfoView.extraLabel.text = post?.item?.author?.location.country
        basicInfoView.firstIcon.image = UIImage(named: "addPerson")
        basicInfoView.secoundIcon.image = UIImage(named: "Dot")
    }
    func handlingMediaView () {
        
    }
}
