//
//  TableViewCell.swift
//  Gird-List View
//
//  Created by Ali on 11/11/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

 
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var Labelpublished: UILabel!
    
    @IBOutlet weak var LabelSubtext: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
