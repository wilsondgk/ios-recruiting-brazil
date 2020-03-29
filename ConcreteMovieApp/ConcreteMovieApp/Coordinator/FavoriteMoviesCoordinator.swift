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
        let presenter = FavoriteMoviesPresenter()
        let worker = FavoriteMoviesWorker(withProvider: MoyaApiProvider())
        let interactor = FavoriteMoviesInteractor(withPresenter: presenter, andWorker: worker)
        let favoriteMoviesVC = FavoriteMoviesViewController(withInteractor: interactor)
        presenter.setView(favoriteMoviesVC)
        let tabItem = UITabBarItem(title: "Favorites", image: UIImage(named: "favorite_icon"), tag: 1)
        favoriteMoviesVC.tabBarItem = tabItem
        navigationController.setViewControllers([favoriteMoviesVC], animated: true)
    }
    
    //MARK: FavoriteMoviesNavigationProtocol
    func showFavoriteMovieDetail() {
        navigationController.pushViewController(UIViewController(), animated: true)
    }
}
