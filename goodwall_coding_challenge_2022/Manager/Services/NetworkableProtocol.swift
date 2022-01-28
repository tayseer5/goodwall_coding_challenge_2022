//
//  NetworkableProtocol.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 28/01/2022.
//

import Foundation
import Moya

/// Network Protocol That contain Provider and Header of fetch method
protocol Networkable {
    var provider: MoyaProvider<GoodWallAPI> { get }

    func getGoodWallPosts(completion: @escaping (Result<PostsApiResponse, Error>) -> ())
   
}
