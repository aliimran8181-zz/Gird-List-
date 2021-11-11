//
//  collectionViewController.swift
//  Gird-List View
//
//  Created by Ali on 11/11/2021.
//

import UIKit

class collectionViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var collectionView: UICollectionView!
    // Initilizing variables
    let burgers = ["Big mac","Hamburger","Zinger", "Mighty Zinger","Double Cheese" ]
    let burgerImage: [UIImage] = [
        UIImage(named: "bigmac")!,
        UIImage(named: "ham")!,
        UIImage(named: "zinger")!,
        UIImage(named: "mighty")!,
        UIImage(named: "double")!
    ]
    
    
    
    //MARK: ViewDIDLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        setUi()
       
        // Do any additional setup after loading the view.
    }
    
    func setUi(){
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0,left: 5,bottom: 0,right: 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 20)/2, height: (self.collectionView.frame.size.height)/3)
    }
    
   /*
    //MARK: Collection View Methods
    
    */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return burgers.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! collectionViewCell
        cell.lblView.text = burgers[indexPath.item]
        cell.burgerImage.image = burgerImage[indexPath.item]
        cell.layer.borderColor = UIColor.green.cgColor
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 2
    
        return cell
    }
  
}
