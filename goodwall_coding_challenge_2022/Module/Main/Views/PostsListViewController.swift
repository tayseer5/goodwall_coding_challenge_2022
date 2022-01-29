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
    // MARK: - Varibles
    var postsListViewModel = PostsListViewModel()
    var disposeBag = DisposeBag()
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Helping Function
    private func prepareUI() {
        
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
        
        
    }
}
