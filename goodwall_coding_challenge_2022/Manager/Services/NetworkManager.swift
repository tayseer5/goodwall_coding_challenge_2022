//
//  NetworkManager.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 28/01/2022.
//

import Foundation
import Moya

/// Network Manager that confirm Network Protocol , add logic of fetching data and logic of how to request data from provider for API file
class NetworkManager: Networkable {
    var provider = MoyaProvider<GoodWallAPI>(plugins: [NetworkLoggerPlugin()])

    func getGoodWallPosts( completion: @escaping (Result<PostsApiResponse, Error>) -> ()) {
        request(target: .goodWallPosts, completion: completion)
    }
}

private extension NetworkManager {
    //generic request method to prevents code dublication and used Result as return type to make it generic and able to know the case of response from enum if it success with response or fail with error
    private func request<T: Decodable>(target: GoodWallAPI, completion: @escaping (Result<T, Error>) -> ()) {
        
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
