//
//  collectionViewController.swift
//  Gird-List View
//
//  Created by Ali on 11/11/2021.
//

import UIKit
import SDWebImage
class collectionViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  
    @IBOutlet weak var collectionView: UICollectionView!
    // Initilizing variables
    
    var articles: Array<Dictionary<String,Any>> = []
    
    //MARK: ViewDIDLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        loadData()
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
        print(articles.count)
       return articles.count
      
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = articles[indexPath.row];
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! collectionViewCell
        
        if let title = row["title"] as? String{
            cell.titleLabel.text = title;
        }
        
        if let description = row["description"] as? String{
            cell.LabelSubtext.text = description
            
        }
        
        if let urlToImage = row["urlToImage"] as? String{
            cell.ImageView.sd_setImage(with: URL(string: urlToImage), placeholderImage: UIImage(named: "placeholder"))
           }
        
        if let publishedDate = row["publishedAt"] as? String{
                cell.labelPublished.text = "Published : " + publishedDate

            

        }
        cell.layer.cornerRadius = 5
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 2
        return cell;
    }
    func loadData(){
            URLSession.shared.dataTask(with: URLRequest(url : apiUrl!)) { (data, response, error) in
                if let httpResponse = response as? HTTPURLResponse {
                    if(httpResponse.statusCode != 200) {
                    }
                }
    
                if let myData = data {
                    if let json = try? JSONSerialization.jsonObject(with: myData, options: []) as? Dictionary<String,Any> {
                        //PARSE IT
                        if let statusCode = json["status"] as? String {
                            if(statusCode == "ok") {
                                if let articles = json["articles"] as? Array<Dictionary<String,Any>> {
                                    self.articles = articles;
                                    DispatchQueue.main.async {
                                        self.collectionView.reloadData()
                                    }
                                } else {
                                    //ERROR WITH API REQUEST NOT OK
                                }
                            }
                        } else {
                            //ERROR WITH API REQUEST NOT OK
                        }
                    } else {
                        print("Error");
                    }
                }
            }
            .resume();
        }
}
