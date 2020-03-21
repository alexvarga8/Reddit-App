//
//  LoginFlowCoordinator.swift
//  RedditApp
//
//  Created by Alexandru Varga on 20/03/2020.
//  Copyright © 2020 Alexandru Varga. All rights reserved.
//

import UIKit

class LoginFlowCoordinator: NSObject {
    var navigationController: UINavigationController

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }

    public convenience init(forLoginWebViewController navigationController: UINavigationController) {
        self.init(navigationController: navigationController)
    }

    func start() {
        let controller = LoginWebViewController(nibName: "LoginWebViewController", bundle: nil)
        self.show(controller, animated: true)
    }

    func show(_ viewController: UIViewController, animated: Bool) {
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
