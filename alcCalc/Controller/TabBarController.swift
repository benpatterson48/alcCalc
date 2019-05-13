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
        let personalMacrosVC = MacrosVC()
        let macrosBarItem = UITabBarItem(title: "Personal", image: UIImage(named: "personalMacrosGrey"), selectedImage: UIImage(named: "personalMacros"))
        personalMacrosVC.tabBarItem = macrosBarItem
        
        let alcoholMacrosVC = MainVC()
        let alcoholBarItem = UITabBarItem(title: "Alcohol", image: UIImage(named: "selectedAlcoholGrey"), selectedImage: UIImage(named: "selectedAlcohol"))
        alcoholMacrosVC.tabBarItem = alcoholBarItem
        
        self.tabBar.barTintColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        self.viewControllers = [personalMacrosVC, alcoholMacrosVC]
        
    }


}
