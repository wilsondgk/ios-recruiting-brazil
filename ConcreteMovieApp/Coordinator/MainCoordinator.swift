//
//  MainCoordinator.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 20/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import Foundation
import UIKit

final class MainCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(withNavigationController navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabBarVC = BaseTabBarViewController(withViewControllers: [createMovieListViewController(), createFavoriteMoviesViewController()])
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(tabBarVC, animated: false)
    }
    
    private func createMovieListViewController() -> UIViewController {
        let movieListVC = MoviesListViewController()
        movieListVC.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(named:"movie_list_icon") , tag: 0)
        return movieListVC
    }
    
    private func createFavoriteMoviesViewController() -> UIViewController {
        let favoriteMoviesVC = FavoriteMoviesViewController()
        favoriteMoviesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "favorite_icon") , tag: 1)
        return favoriteMoviesVC
    }
}
