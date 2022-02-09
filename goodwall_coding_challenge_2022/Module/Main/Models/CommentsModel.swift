//
//  CommentsModel.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 02/02/2022.
//

import Foundation
import Realm
import RealmSwift

class PostComments: Object {
    @Persisted (primaryKey: true) var postid = 0
    @Persisted var comments: List<Comments>
}

class Comments: EmbeddedObject {
    @Persisted var userName: String = ""
    @Persisted var profileImage: String = ""
    @Persisted var comment: String = ""
    
}
