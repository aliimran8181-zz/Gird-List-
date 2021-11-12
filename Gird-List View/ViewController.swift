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
        Change.setImage(UIImage(named: "list.png"), for: .normal)
        
    }
    @IBAction func ChangeTapped(_ sender: Any) {
        isSelected = !isSelected
        if isSelected {
                ContainerView2.isHidden = false
                ContainerView1.isHidden = true
                Change.setImage(UIImage(named: "list.png"), for: .normal)
                Titlelbl.text = "Grid View"
            } else {
                ContainerView1.isHidden = false
                ContainerView2.isHidden = true
                Change.setImage(UIImage(named: "grid.png"), for: .normal)
                Titlelbl.text = "Table View"
                            }
   
    
    }
    
}


