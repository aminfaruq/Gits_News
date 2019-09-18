//
//  MainTabVcViewController.swift
//  Gits News
//
//  Created by Amin faruq on 17/09/19.
//  Copyright © 2019 Amin faruq. All rights reserved.
//

import UIKit

class MainTabVcViewController: UITabBarController , UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        self.delegate = self

        //View Controller
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        let favoriteStoryBoard = UIStoryboard(name: "Favorite", bundle: nil)

        //initialization
        let home = storyBoard.instantiateViewController(withIdentifier: "toHome") as! HomeController
        let nav = UINavigationController(rootViewController: home)
        
        nav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        
        let favorite = favoriteStoryBoard.instantiateViewController(withIdentifier: "favoriteVC") as! FavoriteViewController
        
        favorite.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(named: "favorite"), tag: 1)
       
        
        let vcs : [UIViewController] = [nav, favorite]
        setViewControllers(vcs, animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    
    

   

}
