//
//  RedditTableViewCell.swift
//  RedditApp
//
//  Created by Alexandru Varga on 23/03/2020.
//  Copyright © 2020 Alexandru Varga. All rights reserved.
//

import UIKit

class RedditTableViewCell: UITableViewCell {
    @IBOutlet var redditImageView: UIImageView?
    @IBOutlet var redditTitleLabel: UILabel!
    @IBOutlet var redditDateLabel: UILabel!
    
    var imageUrl = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        redditImageView?.image = nil   
        imageUrl = ""
    }
    
}
