//
//  RedditTablePresenter.swift
//  RedditApp
//
//  Created by Alexandru Varga on 24/03/2020.
//  Copyright © 2020 Alexandru Varga. All rights reserved.
//

import Foundation

struct RedditPostViewModel {
    var redditPost: RedditPost
    
    var postTitleDisplayText: String {
        return redditPost.title
    }
    
    static func dateString(from date: Date) -> String {
        let dateDifference = date.timeIntervalSinceNow
        let hours = Int(dateDifference) / 3600
        let minutes = Int(dateDifference) / 60
        
        if hours == 0 {
            return "\(abs(minutes)) minutes ago"
        }
        
        return "\(abs(hours)) hours ago"
    }
}

