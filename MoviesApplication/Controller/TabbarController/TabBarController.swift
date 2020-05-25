//
//  TabBarController.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 15.03.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    private let homePageVC = HomePageVC()
    private let moviesVC = MoviesVC()
    private let myCollectionVC = MyCollectionVC()
    private let segmentedVC = SegmentedVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.149, green: 0.157, blue: 0.184, alpha: 1)


        viewControllers = [   createTabBarController(title: "Home", imageName: "HomePage", vc: moviesVC),
                              createTabBarController(title: "Movies ", imageName: "Movies", vc: segmentedVC),
                              createTabBarController(title: "My Collection", imageName: "Collection", vc: myCollectionVC)]
    }
    
    private func createTabBarController(title: String, imageName: String, vc: UIViewController) -> UINavigationController{
        let recentVC = UINavigationController(rootViewController: vc)
        recentVC.tabBarItem.title = title
        recentVC.tabBarItem.image = UIImage(named: imageName)
        return recentVC
    }
}

