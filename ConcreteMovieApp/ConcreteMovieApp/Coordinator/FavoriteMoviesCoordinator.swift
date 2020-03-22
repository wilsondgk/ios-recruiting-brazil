//
//  FavoriteMoviesCoordinator.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 21/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import Foundation
import UIKit

final class FavoriteMoviesCoordinator: Coordinator, FavoriteMoviesNavigationProtocol {
    
    let navigationController: UINavigationController
    
    init(withNavigationController navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let favoriteMoviesVC = FavoriteMoviesViewController(withCoordinator: self)
        favoriteMoviesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "favorite_icon") , tag: 1)
        navigationController.setViewControllers([favoriteMoviesVC], animated: false)
    }
    
    //MARK: FavoriteMoviesNavigationProtocol
    func showFavoriteMovieDetail() {
        navigationController.pushViewController(UIViewController(), animated: true)
    }
}
