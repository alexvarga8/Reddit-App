//
//  WelcomeScreenViewController.swift
//  RedditApp
//
//  Created by Alexandru Varga on 20/03/2020.
//  Copyright © 2020 Alexandru Varga. All rights reserved.
//

import UIKit

class WelcomeScreenViewController: UIViewController {
    @IBOutlet var continueButton: CustomButton!
    private var flowCoorindator: WelcomeScreenFlowCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.layer.cornerRadius = 10.0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueButtonPressed(_ sender: CustomButton) {
        flowCoorindator = WelcomeScreenFlowCoordinator(forWelcomeScreenViewController: self.navigationController!)
        flowCoorindator.start()
    }

}
