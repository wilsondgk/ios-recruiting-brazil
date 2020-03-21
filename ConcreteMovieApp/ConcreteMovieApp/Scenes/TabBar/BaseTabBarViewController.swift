//
//  BaseTabBarViewController.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 20/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {
    
    init(withViewControllers viewControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = viewControllers.map({ (viewController) -> UIViewController in
            let navController = UINavigationController(rootViewController: viewController)
            return navController
        })
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTabBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupTabBar() {
        tabBar.tintColor = Colors.black
        tabBar.unselectedItemTintColor = Colors.black.withAlphaComponent(0.4)
        tabBar.barTintColor = Colors.appYellow
    }
}
