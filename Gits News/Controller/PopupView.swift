//
//  PopupView.swift
//  Gits News
//
//  Created by Amin faruq on 17/09/19.
//  Copyright © 2019 Amin faruq. All rights reserved.
//

import UIKit
import M13Checkbox

class PopupView: UIViewController {

    var isSelected = true
    
    
    @IBOutlet weak var imageButton: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnCheck(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            imageButton.image = UIImage(named: "star1")
        } else {
            sender.isSelected = true
            imageButton.image = UIImage(named: "star2")
        }
    }
    
}
