//
//  PostsApiResponse.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 28/01/2022.
//

import Foundation
import SwiftUI

// MARK: - Welcome
struct PostsApiResponse: Codable {
    let response: Response?
    let status: String?
}

// MARK: - Response
struct Response: Codable {
    let errorCode: Int?
    let payload: Payload?
    let statusCode: Int?

    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case payload
        case statusCode = "status_code"
    }
}

// MARK: - Payload
struct Payload: Codable {
    let posts: [Post]?
    
    enum CodingKeys: String, CodingKey {
        case posts = "entries"
    }
}


// MARK: - Entry
struct Post: Codable {
    let contentType: String?
    let item: Item?

    enum CodingKeys: String, CodingKey {
        case contentType = "content_type"
        case item
    }
}

// MARK: - Item
struct Item: Codable {
    let author: Author?
    let body, category: String?
    let contentType, created: String?
    let hashtagCount: Int?
    let hashtags: [String]?
    let id: Int?
    let likeCount: Int?
    let locationID: Int?
    let occupations, pictureNames: [String]?
    let skillCount: Int?
    let skills: [String]?
    let timelineDate, title: String?
    let videos: [Videos]?
    let viewCount: Int?

    enum CodingKeys: String, CodingKey {
        case author
        case body, category
        case contentType = "content_type"
        case created
        case hashtagCount = "hashtag_count"
        case hashtags, id
        case likeCount = "like_count"
        case locationID = "location_id"
        case occupations
        case pictureNames = "picture_names"
        case skillCount = "skill_count"
        case skills
        case timelineDate = "timeline_date"
        case title
        case videos
        case viewCount = "view_count"
    }
}

// MARK: - Author
struct Author: Codable {
    let about, displayName: String?
    let id: Int?
    let picture, pictureName: String?
    let location:Location

    enum CodingKeys: String, CodingKey {
        case about
        case displayName = "display_name"
        case id
        case picture
        case pictureName = "picture_name"
        case location
    }
}
// MARK: - Video
struct Videos: Codable {
    let videoUrl: String?
    let urls: Urls?
    enum CodingKeys: String, CodingKey {
        case videoUrl = "guid"
        case urls
    }
}
// MARK: - Urls
struct Urls: Codable {
    let videoUrl, thumbnailUrls: [String]?

    enum CodingKeys: String, CodingKey {
        case videoUrl = "mp4_urls"
        case thumbnailUrls = "thumbnail_urls"
    }
}
// MARK: - location
struct Location: Codable {
    let area: String?
    let country: String?
    
    enum CodingKeys: String, CodingKey {
        case area = "admin_area_1"
        case country
    }
}

