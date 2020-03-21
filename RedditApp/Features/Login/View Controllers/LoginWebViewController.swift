//
//  LoginWebViewController.swift
//  RedditApp
//
//  Created by Alexandru Varga on 20/03/2020.
//  Copyright © 2020 Alexandru Varga. All rights reserved.
//

import UIKit
import WebKit

class LoginWebViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.reddit.com/api/v1/authorize?client_id=q2iE4g8fePvMng&response_type=code&state=test&redirect_uri=RedditApp://oauth-callback&duration=temporary&scope=identity")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    convenience init() {
        self.init(nibName: "LoginWebViewController", bundle: nil)
    }
    
}
