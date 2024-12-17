//
//  ViewController.swift
//  Ela's App
//
//  Created by Kaushal Janga on 6/24/24.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.backgroundColor = #colorLiteral(red: 1, green: 0.8232482076, blue: 0.3870663047, alpha: 1)

        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: SearchViewController())
        let vc3 = UINavigationController(rootViewController: PlayViewController())
        
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc1.title = "Home"
        
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc2.title = "Search"
        
        vc3.tabBarItem.image = UIImage(systemName: "play")
        vc3.title = "Recs"
        
        setViewControllers([vc1, vc2, vc3], animated: true)
        
        
    }


}

