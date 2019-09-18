//
//  DetailViewController.swift
//  Gits News
//
//  Created by Amin faruq on 16/09/19.
//  Copyright © 2019 Amin faruq. All rights reserved.
//

import UIKit
import WebKit
import M13Checkbox
import PopupDialog

class DetailViewController: UIViewController  {
    
    @IBOutlet weak var imgBerita: UIImageView!
    
    @IBOutlet weak var lbJudulBerita: UILabel!
    
    @IBOutlet weak var lbDetailBerita: UILabel!
    
    var gambarBerita : String?
    var detailBerita : String?
    var judulBerita : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = try? Data(contentsOf: URL(string: gambarBerita!)!)
        
        lbJudulBerita.text = judulBerita
        lbDetailBerita.text = detailBerita
        imgBerita.image = UIImage(data: data!)
        self.title = judulBerita
      
    }
    
    
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
       
        let vc = PopupView(nibName: "PopupView", bundle: nil)
        
        let popup = PopupDialog(viewController: vc, buttonAlignment: .vertical, transitionStyle: .zoomIn,tapGestureDismissal: true)
        
        self.present(popup, animated: true, completion: nil)
        
        
    }
    

    
}


