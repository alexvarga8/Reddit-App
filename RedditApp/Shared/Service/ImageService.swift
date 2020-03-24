//
//  ImageService.swift
//  RedditApp
//
//  Created by Alexandru Varga on 24/03/2020.
//  Copyright © 2020 Alexandru Varga. All rights reserved.
//

import UIKit

class ImageService {
    static let sharedInstance = ImageService()
    private let urlSession = URLSession(configuration: .default)
    private var imageCache = NSCache<NSString, UIImage>()
    
    private init() { }
    
    func fetchImage(forUrl url: String) -> UIImage? {
        return imageCache.object(forKey: url as NSString)
    }
    
    func downloadImage(forURL url: String, completion: @escaping (UIImage?) -> Void) {
        if let image = fetchImage(forUrl: url) {
            completion(image)
            return
        }
        
        guard let imageURL = URL(string: url) else {
            completion(nil)
            return
        }
        
        let dataTask = urlSession.dataTask(with: imageURL) { [weak self] (data, response, error) in
            guard let data = data,
                let response = response as? HTTPURLResponse,
                let image = UIImage(data: data),
                error == nil,
                response.statusCode == 200 else {
                    completion(nil)
                    return
            }
            self?.imageCache.setObject(image, forKey: url as NSString)
            completion(image)
        }
        
        dataTask.resume()
    }
    
}
