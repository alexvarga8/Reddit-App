//
//  LoginView.swift
//  RedditApp
//
//  Created by Alexandru Varga on 20/03/2020.
//  Copyright © 2020 Alexandru Varga. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    @IBOutlet var loginButton: CustomButton!
    
    var view: UIView!
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "LoginView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibSetup()
    }
    
}
