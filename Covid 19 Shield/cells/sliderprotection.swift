//
//  sliderprotection.swift
//  Covid 19 Shield
//
//  Created by Mohamed on 6/9/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit

class sliderprotection: UICollectionViewCell {
    
    
    @IBOutlet weak var imgeview: UIImageView!
    
    @IBOutlet weak var labell: UILabel!
    
    @IBOutlet weak var labeldatils: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgeview.layer.cornerRadius = 15
        imgeview.clipsToBounds = true
        imgeview.layer.shadowColor = UIColor.black.cgColor
        imgeview.layer.shadowOpacity = 0.1
        imgeview.layer.shadowOffset = .zero
        imgeview.layer.shadowRadius = 10.0
        imgeview.layer.shadowPath = UIBezierPath(rect:imgeview.layer.bounds).cgPath
        imgeview.layer.shouldRasterize = true
        
        
    }
}


