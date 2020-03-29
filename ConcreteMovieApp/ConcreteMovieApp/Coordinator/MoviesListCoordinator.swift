//
//  MovieListCoordinator.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 20/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import Foundation
import UIKit

final class MoviesListCoordinator: Coordinator, MoviesListNavigationProtocol {
    
    private let navigationController: UINavigationController
    
    init(withNavigationController navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let presenter = MoviesListPresenter()
        let worker = MoviesListWorker(withProvider: MoyaApiProvider())
        let interactor = MoviesListInteractor(withPresenter: presenter,
                                              andWorker: worker)
        let movieListVC = MoviesListViewController(withInteractor: interactor)
        presenter.setView(movieListVC)
        movieListVC.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(named: "movie_list_icon") , tag: 0)
        navigationController.setViewControllers([movieListVC], animated: true)
    }
    
    //MARK: MoviesListNavigationProtocol
    func showMovieDetailVC() {
        navigationController.pushViewController(UIViewController(), animated: true)
    }
}
