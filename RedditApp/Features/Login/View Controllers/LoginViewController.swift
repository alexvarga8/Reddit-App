//
//  LoginViewController.swift
//  RedditApp
//
//  Created by Alexandru Varga on 20/03/2020.
//  Copyright © 2020 Alexandru Varga. All rights reserved.
//

import UIKit
import OAuthSwift

class LoginViewController: UIViewController {
    @IBOutlet var loginView: LoginView!
    var flowCoordinator: LoginFlowCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
    }
    
    convenience init() {
        self.init(nibName: "LoginViewController", bundle: nil)
    }
    
    @objc func loginButtonPressed() {
        flowCoordinator = LoginFlowCoordinator(forLoginWebViewController: self.navigationController!)
        flowCoordinator.start()
    }

}
