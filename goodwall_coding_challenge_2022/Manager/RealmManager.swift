//
//  RealmManager.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 02/02/2022.
//

import Foundation
import Realm
import RealmSwift

class WARealmManager: NSObject {
    // MARK: - property
    static let shared = WARealmManager()
    private let realm = try? Realm()
    //MARK: Realm CRUDs
    /*
     Saves an object or an array of objects to realm with update, object type needs to have a primary key.
     */
    func saveWithUpdate(model : Object) {
        do {
            try realm?.write {
                realm?.add(model, update: .modified)
            }
        }catch{
            
        }
    }
    
    func saveWithUpdateArr(model : [Object]) {
        do {
            try realm?.write {
                realm?.add(model, update: .all)
            }
        }catch{
            
        }
    }
    
    /*
    deletes an object or an array of objects in realm
    */
    func deleteAllinTable(model : Object) {
        do {
//            print(realm?.configuration.fileURL as Any)
            try realm?.write {
                realm?.delete(model)
            }
        }catch{
            
        }
    }
    
    func deleteAllinTableArr(model : [Object]) {
        do {
            try realm?.write {
                realm?.delete(model)
            }
        }catch{
            
        }
    }
    
    //MARK: CRUD Movies
    func getPostComments(id:Int) -> PostComments? {
        if let results = self.realm?.objects(PostComments.self) {
            let commentsForPost = results.where {
                $0.postid == id
            }
            return commentsForPost.first
        }
        return nil
    }
    
    func createPostCommentNode(postComments:PostComments) {
        self.saveWithUpdate(model: postComments)
    }
}
