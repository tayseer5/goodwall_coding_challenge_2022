//
//  GoodWallAPI.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 28/01/2022.
//

import Foundation
import Moya

//enums for apis used in app
enum GoodWallAPI {
    case goodWallPosts
}

// This is the variables used to create the api request
extension GoodWallAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Constant.baseURL) else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .goodWallPosts:
            return Constant.version + Constant.endPoint
        }
    }
    
    
    var method: Moya.Method {
            return .get
    }
    
    var sampleData: Data {
            return Data()
    }
    
    var task: Task {
        switch self {
        case .goodWallPosts:
            return .requestPlain
            }
    }
    var headers: [String : String]? {
            return nil
        }
    
}
