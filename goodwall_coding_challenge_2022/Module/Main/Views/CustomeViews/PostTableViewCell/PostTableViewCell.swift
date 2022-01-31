//
//  PostTableViewCell.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 30/01/2022.
//

import UIKit
import RxCocoa
import RxSwift

class PostTableViewCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet weak var basicInfoView: BasicInfo!
    @IBOutlet weak var mediaInfoView: MediaInfo!
    @IBOutlet weak var fullDescriptionView: FullDescrptionsView!
    @IBOutlet weak var commentsAndTagView: UIView!
    @IBOutlet weak var tagCollectionView: UICollectionView!
    @IBOutlet weak var commentsTableView: UITableView!
    @IBOutlet weak var numberOfCommetsLabel: UILabel!
    @IBOutlet weak var commentsAndTagHight: NSLayoutConstraint!
    @IBOutlet weak var tagViewHight: NSLayoutConstraint!
    @IBOutlet weak var commentsViewHight: NSLayoutConstraint!
    // MARK: - Varibles
    public var post: Post?{
        didSet {
            if post != nil {
                handlingUI()
            }
        }
    }
    var lastComments: BehaviorRelay<[String]> = BehaviorRelay(value: [])
    var hashTagsSubject: BehaviorRelay<[String]> = BehaviorRelay(value: [])
    var disposeBag = DisposeBag()
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
        var viewHight = commentsAndTagHight.constant
        if let hashTags = post?.item?.hashtags , hashTags.count > 0 {
            hashTagsSubject.accept(hashTags)
            handlingTagsCollectionView()
            
        } else {
            tagViewHight.constant = 0
            tagCollectionView.isHidden = true
            viewHight -= 75
        }
        let comments = ["test","hello","test2","tayseer","test3","again","test4","back","test5","isAllah"]
        if !(comments.count > 0) {
            commentsViewHight.constant = 0
            commentsTableView.isHidden = true
            numberOfCommetsLabel.text = "0 Comments"
            viewHight -= 190
        } else {
            numberOfCommetsLabel.text = "\(comments.count) Comments"
           // handlingCommentsTable()
            viewHight -= 190
            if comments.count == 2 {
                viewHight += 190
            }else {
                viewHight += 80
            }
            lastComments.accept( comments.count > 2 ? [comments[comments.count - 1],comments[comments.count - 2]]: [comments[comments.count - 1]])
        }
    }
    func handlingCommentsTable () {
        let commentsTableViewCell = UINib(nibName: "CommentsTableViewCell",
                                          bundle: nil)
        commentsTableView.register(commentsTableViewCell , forCellReuseIdentifier: "commentsCell")
        //90 + 90 = 180
        // binding posts to posts container
        lastComments
            .bind(to: commentsTableView
                    .rx
                    .items(cellIdentifier: "commentsCell", cellType: CommentsTableViewCell.self)){ (row,comment,cell) in
               // cell.commentLabel.text = comment
                //binding cell data
            }.disposed(by: disposeBag)
        //handling delegate
//        commentsTableView
//            .rx
//            .setDelegate(self)
//            .disposed(by: disposeBag)
    }
    func handlingTagsCollectionView () {
        if let flowLayout = tagCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
              flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            }
        //preferredLayoutAttributesFittingAttributes
        tagCollectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "tagCell")
        // binding posts to posts container
        hashTagsSubject
            .bind(to: tagCollectionView
                    .rx
                    .items(cellIdentifier: "tagCell", cellType: TagCollectionViewCell.self)){ (row,tag,cell) in
                //binding cell data
                //print("tayseer")
               // print(tag)
               // cell.tagLabel.text = tag
            }.disposed(by: disposeBag)
    }
    // MARK: - handling Data
    func handlingMediaData()->[String]{
        var media:[String] = []
        media.append(contentsOf:  post?.item?.pictureNames ?? [])
        if let videos = post?.item?.videos, videos.count > 0{
            var videosUrl: [String] = []
            let test = videos.map({ (video: Videos) in
                videosUrl.append(contentsOf: video.urls?.thumbnailUrls ?? [])
            
            //self.thumbnailUrls(video: video)
        })
            print(test)
            media.append(contentsOf:  videosUrl)
        }
        
        return media
    }
}
