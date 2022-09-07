//
//  PostData.swift
//  Hacker News
//
//  Created by Al-Amin on 18/8/22.
//

import Foundation

struct Results: Decodable {
    var hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    var objectID: String
    var url: String?
    var title: String
    var points: Int
}
