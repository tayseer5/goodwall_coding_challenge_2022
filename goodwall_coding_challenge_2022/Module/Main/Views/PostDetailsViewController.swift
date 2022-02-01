//
//  PostDetailsViewController.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 01/02/2022.
//

import UIKit
import RxCocoa
import RxSwift

class PostDetailsViewController: UIViewController {
    // MARK: - IBOutLet
    @IBOutlet weak var postDetailsTableview: UITableView!
    // MARK: - Varibles
    var postDetailsViewModel = PostDetailsViewModel()
    var disposeBag = DisposeBag()
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
    }
    // MARK: - Helping Function
    private func prepareTableView() {
        let postMainDetailsTableViewCell = UINib(nibName: "PostMainDetailsTableViewCell",
                                          bundle: nil)
        let commentsTableViewCell = UINib(nibName: "CommentsTableViewCell",
                                          bundle: nil)
        postDetailsTableview.register(postMainDetailsTableViewCell , forCellReuseIdentifier: "postMainDetails")
        postDetailsTableview.register(commentsTableViewCell , forCellReuseIdentifier: "commentsCell")
        postDetailsTableview.delegate = self
        postDetailsTableview.dataSource = self
    }
}
// MARK: - UITableViewDataSource extension
extension PostDetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
            // statements
          default:
            return postDetailsViewModel.comments.count
            // statements
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "postMainDetails", for: indexPath as IndexPath) as? PostMainDetailsTableViewCell
            //cell?.commentLabel.text = lastComments?[indexPath.row] ?? "" + (post?.item?.title ?? "title")
            cell?.post = postDetailsViewModel.post
            return cell ?? UITableViewCell ()
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "commentsCell", for: indexPath as IndexPath) as? CommentsTableViewCell
            cell?.commentLabel.numberOfLines = 0
            cell?.commentLabel.text =  postDetailsViewModel.comments[indexPath.row]
            return cell ?? UITableViewCell ()
        }
       
    }
}
// MARK: - UITableViewDelegate extension
extension PostDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
