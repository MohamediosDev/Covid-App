//
//  protictionViewController.swift
//  Covid 19 Shield
//
//  Created by Mohamed on 6/9/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit

class protictionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var vieww: UIView!
    
    
    @IBOutlet weak var collectionview2: UICollectionView!
    
    @IBOutlet weak var view2: UIView!
    
  
    
  let arayoftext = ["Wash your hand","Stay safe","wear  mask","Keep Distance","if you sick call doctor"]
    let arrayofdetalis = ["You must wash your hands thoroughly with soap and water every 15 minutes or more to prevent the infection from this virus","You must stay in your home in order to stay safe from any virus and avoid contact with people","You should wear the muzzle in public places if it comes out as strictly necessary","You should avoid people and maintain a social distance between you and any person","If you feel any fatigue, you should talk to a specialist, and stick to the house"]
    
    let arrayoimages = [UIImage(named: "1"),
    UIImage(named: "2"),
    UIImage(named: "3"),
    UIImage(named: "4"),
    UIImage(named: "5")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vieww.layer.cornerRadius = 20
        vieww.clipsToBounds = true
        vieww.layer.shadowColor = UIColor.black.cgColor
        vieww.layer.shadowOpacity = 0.6
        vieww.layer.shadowOffset = .zero
        vieww.layer.shadowRadius = 10.0
        vieww.layer.shadowPath = UIBezierPath(rect:vieww.layer.bounds).cgPath
        vieww.layer.shouldRasterize = true
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arayoftext.count
    }
    
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview2.dequeueReusableCell(withReuseIdentifier: "sliderprotection", for: indexPath) as! sliderprotection
        cell.imgeview.image = arrayoimages[indexPath.item]
        cell.labell.text = arayoftext[indexPath.item]

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "details") as? details
        
        vc?.arrrayy = arayoftext[indexPath.item]
        vc?.imagevieww = arrayoimages[indexPath.item]
        vc?.arrayofdeatalis = arrayofdetalis[indexPath.item]
//        vc?.imagees = arrayoimages
        navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
    

    
    
}
