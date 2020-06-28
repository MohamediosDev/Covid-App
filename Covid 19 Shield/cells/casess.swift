//
//  casess.swift
//  Covid 19 Shield
//
//  Created by Mohamed on 6/4/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit

class casess: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewcases.layer.cornerRadius = viewcases.frame.width/2
        viewcases.clipsToBounds = true
        viewcases.layer.masksToBounds = true
        
    }
    @IBOutlet weak var casesname: UILabel!
    
    
    @IBOutlet weak var viewcases: UIView!
    
    
    @IBOutlet weak var numbercases: UILabel!
    
    
    
    
    

       }


