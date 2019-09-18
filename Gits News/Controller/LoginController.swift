//
//  ViewController.swift
//  Gits News
//
//  Created by Amin faruq on 16/09/19.
//  Copyright © 2019 Amin faruq. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    @IBAction func toNewsHome(_ sender: UIButton) {
        
       let storyboard = UIStoryboard(name: "MainTabbar", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() as? MainTabVcViewController else {
            return
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

