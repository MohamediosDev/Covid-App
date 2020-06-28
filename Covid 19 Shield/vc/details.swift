//
//  details.swift
//  Covid 19 Shield
//
//  Created by Mohamed on 6/9/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit

class details: UIViewController {

    
    @IBOutlet weak var imageview2: UIImageView!
    
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label2: UILabel!
    var arrrayy:String?
//    var imagees:[UIImag]()
    var name = ""
    var imagevieww:UIImage?
    var arrayofdeatalis:String?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label2.text = arrrayy
        imageview2.image = imagevieww
        label3.text = arrayofdeatalis

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
