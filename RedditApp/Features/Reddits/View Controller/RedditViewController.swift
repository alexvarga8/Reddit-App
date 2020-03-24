//
//  RedditViewController.swift
//  RedditApp
//
//  Created by Alexandru Varga on 24/03/2020.
//  Copyright © 2020 Alexandru Varga. All rights reserved.
//

import UIKit

class RedditViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var redditPostViewModels = [RedditPostViewModel]()
    private var nextPostToLoad: String?
    private var isLoadingPosts = false
    private let cellIdentifier = "RedditTableViewCell"
    private lazy var redditDataService = RedditDataService()
    private lazy var imageService = ImageService.sharedInstance
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        loadRedditPosts()
        // Do any additional setup after loading the view.
    }

    convenience init() {
        self.init(nibName: "RedditViewController", bundle: nil)
    }
    
    private func loadRedditPosts() {
        isLoadingPosts = true
        if redditPostViewModels.isEmpty {
            activityIndicator.startAnimating()
        }
        
        redditDataService.getPosts(after: nextPostToLoad) { [weak self] (nextPostToLoad, redditPosts) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                guard let redditPosts = redditPosts else { return }
                let redditPostViewModels = redditPosts.map { RedditPostViewModel(redditPost: $0) }
                self.redditPostViewModels.append(contentsOf: redditPostViewModels)
                self.nextPostToLoad = nextPostToLoad
                self.tableView.reloadData()
                self.isLoadingPosts = false
            }
        }
    }
    
    func configure(_ cell: RedditTableViewCell, with redditPostViewModel: RedditPostViewModel) {
        cell.redditTitleLabel.text = redditPostViewModel.postTitleDisplayText
        
        if let imageUrl = redditPostViewModel.redditPost.imageURL,
            let image = imageService.fetchImage(forUrl: imageUrl) {
            cell.redditImageView?.image = image
        } else if let imageUrl = redditPostViewModel.redditPost.imageURL {
            cell.imageUrl = imageUrl
            imageService.downloadImage(forURL: imageUrl) { (image) in
                if let image = image,
                    cell.imageUrl == imageUrl {
                    DispatchQueue.main.async {
                        cell.redditImageView?.image = image
                    }
                }
            }
        }
    }
    
}

extension RedditViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return redditPostViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let redditPostViewModel = redditPostViewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RedditTableViewCell
        
        configure(cell, with: redditPostViewModel)
        
        return cell
    }
    
}

extension RedditViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let _ = nextPostToLoad,
            scrollView.contentOffset.y > (scrollView.contentSize.height - scrollView.frame.size.height),
            !isLoadingPosts {
            loadRedditPosts()
        }
    }
}


