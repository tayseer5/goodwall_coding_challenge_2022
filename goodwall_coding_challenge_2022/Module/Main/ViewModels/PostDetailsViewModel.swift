//
//  PostDetailsViewModel.swift
//  goodwall_coding_challenge_2022
//
//  Created by Tayseer Anwar on 01/02/2022.
//

import Foundation
import RxSwift
import RxRelay
import RxCocoa
struct PostDetailsViewModel {
// MARK: - Subjects
//subject is observable and observer
    public var post :Post?
    public var comments :[Comments]
// MARK: - private Varibles
    mutating func saveNewComment(comment:String){
        //comments.append(comment)
        
    }

}

