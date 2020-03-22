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
    private var childCoordinators: [Coordinator] = []
    
    init(withNavigationController navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabBarVC = BaseTabBarViewController(withViewControllers: [createMovieListViewController(), createFavoriteMoviesViewController()])
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(tabBarVC, animated: false)
    }
    
    private func createMovieListViewController() -> UINavigationController {
        let navVC = BaseNavigationController()
        let moviesListCoordinator = MoviesListCoordinator(withNavigationController: navVC)
        childCoordinators.append(moviesListCoordinator)
        moviesListCoordinator.start()
        
        return navVC
    }
    
    private func createFavoriteMoviesViewController() -> UINavigationController {
        let navVC = BaseNavigationController()
        let favoriteCoordinator = FavoriteMoviesCoordinator(withNavigationController: navVC)
        childCoordinators.append(favoriteCoordinator)
        favoriteCoordinator.start()
        
        return navVC
    }
}
