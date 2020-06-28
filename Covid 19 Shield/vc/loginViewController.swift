//
//  loginViewController.swift
//  Covid 19 Shield
//
//  Created by Mohamed on 6/13/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class loginViewController: UIViewController {
    
    
    @IBOutlet weak var Uiviewdesign: UIView!
    
    @IBOutlet weak var EmailTF: UITextField!
    
    @IBOutlet weak var PassTF: UITextField!
    
    @IBOutlet weak var BUdesign: UIButton!
    
    @IBOutlet weak var Errorrlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Uiviewdesign.layer.cornerRadius = 25
        Uiviewdesign.clipsToBounds = true
        Uiviewdesign.layer.shadowRadius = 0.5
        Uiviewdesign.layer.shadowColor = UIColor.black.cgColor
        Uiviewdesign.layer.shadowRadius = 0.5
        Uiviewdesign.layer.shadowOpacity = 0.3
        BUdesign.layer.cornerRadius = 15
        BUdesign.clipsToBounds = true
        Errorrlabel.alpha = 0
        
    
    }
    

    @IBAction func Loginbutton(_ sender: Any) {
        
        
        let email = EmailTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let pass  =  PassTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: pass) { (resulte, error) in
            
            
            if error != nil {
                
                self.Errorrlabel.text = error!.localizedDescription
                self.Errorrlabel.alpha = 1
            }
            
            else {
                
                
                let home = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.tabbar) as? tabbar
                       
                self.view.window?.rootViewController = home
                 
                self.view.window?.makeKeyAndVisible()

                
                
                
            }
        }
        
        
        
        
        
    }
    
}
