//
//  HomeloginViewController.swift
//  Covid 19 Shield
//
//  Created by Mohamed on 6/13/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit

class HomeloginViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var signin: UIButton!
    @IBOutlet weak var signup: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signin.layer.cornerRadius = 15
        signin.clipsToBounds = true
        signup.layer.cornerRadius = 15
        signup.clipsToBounds = true
        signup.layer.shadowOpacity = 0.3
        signup.layer.shadowRadius = 5.0
        signup.layer.masksToBounds = false
        signin.layer.shadowOpacity = 0.3
        signin.layer.shadowRadius = 5.0
        signin.layer.masksToBounds = false
    }
    

    
    
}
