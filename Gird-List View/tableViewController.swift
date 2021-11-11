//
//  tableViewController.swift
//  Gird-List View
//
//  Created by Ali on 11/11/2021.
//

import UIKit

class tableViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    static let cellIdentifier = "ReusableCell"
    /*
     MARK: Taking data from the models
     i've made a message structure in the model that have two variables sender and body
     */
    let burgers = ["Big mac","Hamburger","Zinger", "Mighty Zinger","Double Cheese" ]
    let burgerImage: [UIImage] = [
        UIImage(named: "bigmac")!,
        UIImage(named: "ham")!,
        UIImage(named: "zinger")!,
        UIImage(named: "mighty")!,
        UIImage(named: "double")!
    ]
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 100
    }


}
//MARK: tableView DataSource
extension tableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return burgers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: tableViewController.cellIdentifier, for: indexPath) as! TableViewCell
        cell.textLabel?.text = burgers[indexPath.row]
        cell.burgerImage.image = burgerImage[indexPath.row]
        return cell
        
    }
    
    
}

