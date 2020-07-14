//
//  NavigationMenuBaseController.swift
//  SleepSounds
//
//  Created by Bilal Mustafa on 6/10/20.
//  Copyright © 2020 Code Gradients. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBarController {
    
    var customTabBarMenu: CustomTabBarMenu!
    var tabBarHeight: CGFloat = 75.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadTabBar()
    }
    
    private func loadTabBar() {
        let tabItems: [TabItem] = [.featured, .sounds, .meditation, .more]
        
        self.setupCustomTabBar(tabItems) { (controllers) in
            self.viewControllers = controllers
        }
        
        self.selectedIndex = 0 // default our selected index to the first item
    }
    
    // Build the custom tab bar and hide default
    private func setupCustomTabBar(_ items: [TabItem], completion: @escaping ([UIViewController]) -> Void){
        let frame = tabBar.frame
        var controllers = [UIViewController]()
        
        // hide the tab bar
        tabBar.isHidden = true
        
        self.customTabBarMenu = CustomTabBarMenu(menuItems: items, frame: frame)
        self.customTabBarMenu.translatesAutoresizingMaskIntoConstraints = false
        self.customTabBarMenu.clipsToBounds = true
        self.customTabBarMenu.itemTapped = self.changeTab
        
        // Add it to the view
        self.view.addSubview(customTabBarMenu)
        
        // Add positioning constraints to place the nav menu right where the tab bar should be
        NSLayoutConstraint.activate([
            self.customTabBarMenu.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            self.customTabBarMenu.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            self.customTabBarMenu.widthAnchor.constraint(equalToConstant: tabBar.frame.width),
            self.customTabBarMenu.heightAnchor.constraint(equalToConstant: tabBarHeight), // Fixed height for nav menu
            self.customTabBarMenu.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor)
        ])
        
        for i in 0 ..< items.count {
            controllers.append(items[i].viewController) // we fetch the matching view controller and append here
        }
        
        self.view.layoutIfNeeded() // important step
        completion(controllers) // setup complete. handoff here
    }
    
    func changeTab(tab: Int) {
        self.selectedIndex = tab
        //print("selected: \(self.selectedIndex) ")
        //print("controller: \(self.viewControllers![self.selectedIndex])")
    }
    
}

