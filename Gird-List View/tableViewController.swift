//
//  tableViewController.swift
//  Gird-List View
//
//  Created by Ali on 11/11/2021.
//

import UIKit
import SDWebImage
class tableViewController: UIViewController,UITableViewDataSource {
    var articles: Array<Dictionary<String,Any>> = []
    @IBOutlet var tableView: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
        tableView.rowHeight = 350
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
                                    print(articles)
                                    DispatchQueue.main.async {
                                        self.tableView.reloadData()
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(articles.count)
        return articles.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = articles[indexPath.row];
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        if let title = row["title"] as? String{
            cell.titleLbl.text = title;
        }
        
        if let description = row["description"] as? String{
            cell.LabelSubtext.text = description
            
        }
        
        if let urlToImage = row["urlToImage"] as? String{
            cell.imgView.sd_setImage(with: URL(string: urlToImage), placeholderImage: UIImage(named: "placeholder"))
           }
        
        if let publishedDate = row["publishedAt"] as? String{
                cell.Labelpublished.text = "Published : " + publishedDate
            print(publishedDate)
        }
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        return cell
        
    }
    
    
}
