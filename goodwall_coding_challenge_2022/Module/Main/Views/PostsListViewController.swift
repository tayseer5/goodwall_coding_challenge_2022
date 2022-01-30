//
//  PostsListViewController.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 28/01/2022.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class PostsListViewController: ViewController {
    // MARK: - IBOutLet
    @IBOutlet weak var postsTableView: UITableView!
    // MARK: - Varibles
    var postsListViewModel = PostsListViewModel()
    var disposeBag = DisposeBag()
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        setupBindings()
    }
    // MARK: - Helping Function
    private func prepareTableView() {
        let postTableViewCell = UINib(nibName: "PostTableViewCell",
                                          bundle: nil)
        postsTableView.register(postTableViewCell , forCellReuseIdentifier: "postCell")
        
        
    }
    private func setupBindings() {
        // binding loading to vc
        postsListViewModel.loading.bind(to: self.rx.isAnimating).disposed(by: disposeBag)
        // observing errors to show
        postsListViewModel
            .error
            .observe(on: MainScheduler.instance) //This part of the code is bringing the emitted signals (in our case errors background thread) to the main thread
            .subscribe(onNext: { (error) in
                switch error {
                case .internetError(let message):
                    print(message)
                    MessageView.sharedInstance.showOnView(message: message, messageViewTheme: .error)
                case .serverMessage(let message):
                    print(message)
                   MessageView.sharedInstance.showOnView(message: message, messageViewTheme: .warning)
                }
                
            }).disposed(by: disposeBag)
        // binding posts to posts container
        postsListViewModel
            .posts
            .observe(on: MainScheduler.instance)
            .bind(to: postsTableView
                    .rx
                    .items(cellIdentifier: "postCell", cellType: PostTableViewCell.self)){ (row,post,cell) in
                //binding cell data
                cell.post = post
            }.disposed(by: disposeBag)
        //handling delegate
        postsTableView
            .rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        //handling didselect
        postsTableView
            .rx
            .itemSelected
            .subscribe(onNext:{ indexPath in
                //your code
                print(indexPath)
            }).disposed(by: disposeBag)
            /*
        
//        albumsCollectionView.rx.willDisplayCell
//            .subscribe(onNext: ({ (cell,indexPath) in
//                cell.alpha = 0
//                let transform = CATransform3DTranslate(CATransform3DIdentity, 0, -250, 0)
//                cell.layer.transform = transform
//                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
//                    cell.alpha = 1
//                    cell.layer.transform = CATransform3DIdentity
//                }, completion: nil)
//            })).disposed(by: disposeBag)
        
        albumsCollectionView
            .rx
            .itemSelected
                .subscribe(onNext:{ indexPath in
                    //your code
                    print(indexPath)
                }).disposed(by: disposeBag)
        
//                    .albums
//                    .observeOn(MainScheduler.instance)
//                    .bind(to: albumsViewController.albums)
//                    .disposed(by: disposeBag)
        */
        
        
    }
}
extension PostsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
        
    }
}
