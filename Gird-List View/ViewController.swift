//
//  ViewController.swift
//  Gird-List View
//
//  Created by Ali on 11/11/2021.
//

import UIKit

class ViewController: UIViewController {
    var isSelected :Bool = true
    
    @IBOutlet weak var Titlelbl: UILabel!
    @IBOutlet weak var ContainerView1: UIView!
    @IBOutlet weak var ContainerView2: UIView!
  
    @IBOutlet weak var Change: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        Titlelbl.text = "Grid View"
    }
    @IBAction func ChangeTapped(_ sender: Any) {
        isSelected = !isSelected
            if isSelected {
                ContainerView1.isHidden = true
                ContainerView2.isHidden = false
                Change.setImage(UIImage(named: "grid.png"), for: .normal)
    
                Titlelbl.text = "Grid View"
            } else {
                ContainerView2.isHidden = true
                ContainerView1.isHidden = false
                Change.setImage(UIImage(named: "list.png"), for: .normal)
                Titlelbl.text = "Table View"
                            }
   
    
    }
}

