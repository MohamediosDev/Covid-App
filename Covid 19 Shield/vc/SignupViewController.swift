//
//  SignupViewController.swift
//  Covid 19 Shield
//
//  Created by Mohamed on 6/13/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignupViewController: UIViewController {

    @IBOutlet weak var backview: UIView!
    @IBOutlet weak var firstTF: UITextField!
    
    @IBOutlet weak var SoecondTF: UITextField!
    @IBOutlet weak var EmaillTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    
    @IBOutlet weak var designbu: UIButton!
    
    @IBOutlet weak var errorlabel: UILabel!
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        designbu.layer.cornerRadius = 15
        designbu.clipsToBounds = true
        backview.layer.cornerRadius = 25
        backview.clipsToBounds = true
        errorlabel.alpha = 0 

    }
    
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if firstTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            SoecondTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            EmaillTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        // Check if the password is secure
        let cleanedPassword = passTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
    
    
    @IBAction func Signupbutton(_ sender: Any) {
        
      let error = validateFields()
        
        if error != nil {
            
            showerror(error!)
        }
        else {
            let firstname = self.firstTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastname = self.SoecondTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = self.EmaillTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = self.passTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            //create user
            Auth.auth().createUser(withEmail: email, password: password) { (resulte, err) in
                //check error
                
                if err != nil {
                    
                    self.showerror("Create user")
                }
                else {
                    
                  
                    //create user
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["Firs tname" : firstname , "Last name":lastname , "id":resulte!.user.uid ]) { (error) in
                        
                        if error != nil {
                            
                            
                            self.showerror("Error in server")
                            
                            
                        }
                    }
                    
                    self.Tohome()
                    
                }
                
                
                
            }
            
        }
        
    }
    
    func Tohome() {
        
     let home = storyboard?.instantiateViewController(identifier: Constants.Storyboard.tabbar) as? tabbar
               
        view.window?.rootViewController = home
               view.window?.makeKeyAndVisible()

    }
   
    
  func showerror(_ massege:String)  {
      
    errorlabel.text! = massege
    errorlabel.alpha  = 1
  }

}

