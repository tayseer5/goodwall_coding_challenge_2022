//
//  PostsListViewModel.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 28/01/2022.
//

import Foundation
import RxSwift
import RxRelay
import RxCocoa

struct PostsListViewModel {
    // MARK: - Subjects
    //subject is observable and observer
    public let posts : PublishSubject<[Post]> = PublishSubject()
    public let loading: PublishSubject<Bool> = PublishSubject()
    public let error : PublishSubject<NetworkCallErrors> = PublishSubject()
    // MARK: - private Varibles
    private var apiService: NetworkManager?
    
    //MARK: - Init with Helping Function
    init() {
        self.apiService = NetworkManager()
        getPosts()
    }
    
    private func getPosts(){
        self.loading.onNext(true)
        apiService?.getGoodWallPosts() { result in
            self.loading.onNext(false)
            switch result {
            case .success(let response):
                print(response)
                if let posts = response.response?.payload?.posts  {
                    self.posts.onNext(posts)
                } else {
                    self.error.onNext(.internetError("Cannot Parse Json"))
                }
            case .failure(let error):
                print(error)
                self.error.onNext(.serverMessage("Unknown Error"))
            }
        }
    }

}
