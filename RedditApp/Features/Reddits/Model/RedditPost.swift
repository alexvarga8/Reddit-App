//
//  RedditPost.swift
//  RedditApp
//
//  Created by Alexandru Varga on 24/03/2020.
//  Copyright © 2020 Alexandru Varga. All rights reserved.
//

import Foundation

enum PostType {
    case image
    case standard
}

struct RedditPost {
    var title: String
    var dateCreated: Date
    var imageURL: String?
    var type: PostType
    
    init?(json: [String: Any]) {
        guard let title = json["title"] as? String,
            let dateValue = json["created_utc"] as? Double else {
                return nil
                
        }
        self.title = title
        self.dateCreated = Date(timeIntervalSince1970: dateValue)
        if let imageUrl = json["thumbnail"] as? String,
            imageUrl.lowercased() != "default",
            imageUrl.lowercased() != "self" {
            
            self.imageURL = imageUrl
            self.type = .image
            
        } else {
            self.type = .standard
        }
    }
    
}
