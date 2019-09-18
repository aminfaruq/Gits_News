//
//  TableViewCell.swift
//  Gits News
//
//  Created by Amin faruq on 16/09/19.
//  Copyright © 2019 Amin faruq. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    

    @IBOutlet weak var imgNews: UIImageView!
    
    @IBOutlet weak var lbTitle: UILabel!
    
    @IBOutlet weak var lbDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
