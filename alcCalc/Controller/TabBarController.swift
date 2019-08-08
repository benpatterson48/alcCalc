//
//  TabBarController.swift
//  alcCalc
//
//  Created by Ben Patterson on 5/13/19.
//  Copyright © 2019 Ben Patterson. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    let mainTabBarController = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let macrosVC = Macros()
        let macrosBarItem = UITabBarItem(title: "Personal", image: UIImage(named: "unmacros"), selectedImage: UIImage(named: "macros"))
        macrosVC.tabBarItem = macrosBarItem
        
        let alcoholVC = Alcohol()
        let alcoholBarItem = UITabBarItem(title: "Alcohol", image: UIImage(named: "unalcohol"), selectedImage: UIImage(named: "alcohol"))
        alcoholVC.tabBarItem = alcoholBarItem
		
		let resourcesVC = Resources()
		let resourcesBarItem = UITabBarItem(title: "Resouces", image: UIImage(named: "unresources"), selectedImage: UIImage(named: "resources"))
		resourcesVC.tabBarItem = resourcesBarItem
        
        self.tabBar.barTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.viewControllers = [macrosVC, alcoholVC]
        
    }


}
