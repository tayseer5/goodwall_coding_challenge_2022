//
//  PostMainDetailsTableViewCell.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 01/02/2022.
//

import UIKit
import RxCocoa
import RxSwift

class PostMainDetailsTableViewCell: UITableViewCell {
// MARK: - IBOutlet
@IBOutlet weak var basicInfoView: BasicInfo!
@IBOutlet weak var mediaInfoView: MediaInfo!
@IBOutlet weak var fullDescriptionView: FullDescrptionsView!
@IBOutlet weak var commentsAndTagView: UIView!
@IBOutlet weak var tagCollectionView: UICollectionView!
@IBOutlet weak var numberOfCommetsLabel: UILabel!
@IBOutlet weak var commentsAndTagHight: NSLayoutConstraint!
@IBOutlet weak var tagViewHight: NSLayoutConstraint!
// MARK: - Varibles
public var post: Post?
{
    didSet {
        if oldValue?.item?.id !=  post?.item?.id{
            handlingUI()
                //tagCollectionView.reloadData()
        }
    }
}
var hashTagsVaribles: [String]?
var disposeBag = DisposeBag()
// MARK: - override functions
override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    handlingTagsCollectionView()
}

override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
}
// MARK: - handling design functions
func handlingUI () {
    handlingBasicInfoView()
    handlingMediaView()
    handlingFullDescriptionView()
    handlingViewHight()
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
    let media = handlingMediaData()
    mediaInfoView.mediaSlider.configure(with: media)
    if let category = post?.item?.category {
        mediaInfoView.achivmentView.isHidden = false
    mediaInfoView.achivmetTitle.text = category
    } else {
        mediaInfoView.achivmentView.isHidden = true
    }
}
func handlingFullDescriptionView(){
    fullDescriptionView.titleLabel.text = post?.item?.title
    fullDescriptionView.summeryDescrptionsLabel.text = post?.item?.body
    
}
func handlingViewHight() {
    if let hashTags = post?.item?.hashtags , hashTags.count > 0 {
        commentsAndTagHight.constant = 75.0
        
        tagCollectionView.isHidden = false
        hashTagsVaribles = hashTags
        tagCollectionView.reloadData()
        
    } else {
       commentsAndTagHight.constant = 25.0
        tagViewHight.constant = 0
        tagCollectionView.isHidden = true
    }
    self.commentsAndTagView.updateConstraints()
    self.contentView.updateConstraints()
    self.commentsAndTagView.layoutIfNeeded()
    self.contentView.layoutIfNeeded()
}
func handlingTagsCollectionView () {
    if let flowLayout = tagCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
          flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    tagCollectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "tagCell")
    tagCollectionView.dataSource = self
}
// MARK: - handling Data
func handlingMediaData()->[String]{
    var media:[String] = []
    media.append(contentsOf:  post?.item?.pictureNames ?? [])
    if let videos = post?.item?.videos, videos.count > 0{
        var videosUrl: [String] = []
        videos.map({ (video: Videos) in
            videosUrl.append(contentsOf: video.urls?.thumbnailUrls ?? [])
    })
        media.append(contentsOf:  videosUrl)
    }
    
    return media
}
}

extension PostMainDetailsTableViewCell : UICollectionViewDataSource {
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    hashTagsVaribles?.count ?? 0
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCell", for: indexPath as IndexPath) as? TagCollectionViewCell
    cell?.tagLabel.text = hashTagsVaribles?[indexPath.row] ?? "" + (post?.item?.title ?? "title")
    return cell  ?? UICollectionViewCell()
            
}
}
