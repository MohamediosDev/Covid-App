//
//  ViewController.swift
//  Covid 19 Shield
//
//  Created by Mohamed on 6/2/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionview1: UICollectionView!
    var ApiDictionary:[String:Int] = [:]
 
    var arrayofcases = ["Today cases","Recovered","Deaths","TodayDeaths","TotalTests","critical","All cases"]
    let api = "https://coronavirus-19-api.herokuapp.com/countries/egypt"
    var baseresponse:BaseClass?
    var arrayofnumbers:[Int] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview1.delegate = self
        collectionview1.dataSource = self
        
          Networkcall()
    }

    
    func Networkcall() {
        
        AF.request(api,method:.get).responseJSON { (responsee) in
            do {
                let pars = try JSONDecoder().decode(BaseClass.self, from: responsee.data!)

//                self.ApiDictionary = ["Recovered":pars.recovered ?? 0,"Total cases":pars.todayCases ?? 0,"Deaths":pars.deaths ?? 0,"TodayDeaths":pars.todayDeaths ?? 0 ,"TotalTests":pars.totalTests ?? 0,"critical":pars.critical ?? 0]
                self.arrayofnumbers.append(pars.todayCases ?? 0)
                self.arrayofnumbers.append(pars.recovered ?? 0)
                self.arrayofnumbers.append(pars.deaths ?? 0)
                self.arrayofnumbers.append(pars.todayDeaths ?? 0)
                self.arrayofnumbers.append(pars.totalTests ?? 0)
                self.arrayofnumbers.append(pars.critical ?? 0)
                self.arrayofnumbers.append(pars.cases ?? 0)
                DispatchQueue.main.async {
                    self.collectionview1.reloadData()
                }
                
            }
            catch {
                
                print("Error with sever")
            }
        }
        
    }
    
    func datarecive() ->BaseClass {
        
        
        return baseresponse!
        

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview1.dequeueReusableCell(withReuseIdentifier: "slider", for: indexPath) as! casess
        if arrayofnumbers.count == 0 {
            
        }else{
        cell.casesname.text = arrayofcases[indexPath.item]
        cell.numbercases.text = "\(arrayofnumbers[indexPath.item] ?? 0)"
        }
      cell.viewcases.backgroundColor = .random()
        
        return cell
}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 150)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
}
extension UIColor {
    static func random() -> UIColor{
    return UIColor(
        red: .random(in:0...1),
        green: .random(in:0...1),
        blue: .random(in:0...1),
    alpha:1.0
    )
    }
}
