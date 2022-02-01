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
    public var post: Post?
    {
        didSet {
            if oldValue?.item?.id !=  post?.item?.id{
                handlingUI()
                commentsTableView.reloadData()
                tagCollectionView.reloadData()
            }
        }
    }
    var lastComments: [String]?
    var hashTagsVaribles: [String]?
    var disposeBag = DisposeBag()
    // MARK: - override functions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        handlingCommentsTable()
        handlingTagsCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        lastComments = nil
        hashTagsVaribles = nil
        commentsTableView.reloadData()
        tagCollectionView.reloadData()
        
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
        //var tagViewHightValue = 0.0
        //var commentViewHightValue = 0.0
        //var commentsAndTagHightValue = 0.0
        if let hashTags = post?.item?.hashtags , hashTags.count > 0 {
            commentsAndTagHight.constant = 75.0
            //tagCollectionView.isHidden = false
            hashTagsVaribles = hashTags
            tagCollectionView.reloadData()
            
        } else {
            commentsAndTagHight.constant = 25.0
            //tagCollectionView.isHidden = true
        }
        commentsAndTagView.layoutIfNeeded()
        commentsAndTagView.updateConstraints()
       
        let comments = ["test","hello","test2","tayseer","test3","again","test4","back","test5 \n fdfdf test5 \n fdfdf test5 \n fdfdf test5 /n fdfdf test5 /n fdfdf test5 /n fdfdf test5 /n fdfdf","isAllah test5 \n fdfdf test5 \n fdfdf test5 \n fdfdf test5 /n fdfdf test5 /n fdfdf test5 /n fdfdf test5 /n fdfdf"]
        if !(comments.count > 0) {
            commentsViewHight.constant = 1
            //commentsTableView.isHidden = true
            numberOfCommetsLabel.text = "0 Comments"
        } else {
            //commentsTableView.isHidden = false
            numberOfCommetsLabel.text = "\(comments.count) Comments"
            lastComments = comments.count > 2 ? [comments[comments.count - 1],comments[comments.count - 2]]: [comments[comments.count - 1]]
            if lastComments?.count == 2 {
                commentsViewHight.constant = 140
            }else {
                commentsViewHight.constant = 70
            }
            commentsTableView.reloadData()
        }
        commentsAndTagView.layoutIfNeeded()
        commentsAndTagView.updateConstraints()
        commentsTableView.layoutIfNeeded()
        commentsTableView.updateConstraints()
        self.contentView.layoutIfNeeded()
        self.contentView.updateConstraints()
    }
    func handlingCommentsTable () {
        let commentsTableViewCell = UINib(nibName: "CommentsTableViewCell",
                                          bundle: nil)
        commentsTableView.register(commentsTableViewCell , forCellReuseIdentifier: "commentsCell")
        //90 + 90 = 180
        commentsTableView.dataSource = self
       
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
extension PostTableViewCell : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lastComments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentsCell", for: indexPath as IndexPath) as? CommentsTableViewCell
        cell?.commentLabel.text = lastComments?[indexPath.row] ?? "" + (post?.item?.title ?? "title")
        return cell ?? UITableViewCell ()
                
    }
    
}
extension PostTableViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hashTagsVaribles?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCell", for: indexPath as IndexPath) as? TagCollectionViewCell
        cell?.tagLabel.text = hashTagsVaribles?[indexPath.row] ?? "" + (post?.item?.title ?? "title")
        return cell  ?? UICollectionViewCell()
                
    }
}
