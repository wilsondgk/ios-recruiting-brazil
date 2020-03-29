//
//  FavoriteMoviesViewController.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 20/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import UIKit

protocol FavoriteMoviesNavigationProtocol: class {
    func showFavoriteMovieDetail()
}

protocol FavoriteMoviesInteractorProtocol {
    
}

class FavoriteMoviesViewController: UIViewController, FavoriteMoviesViewProtocol {

    private let interactor: FavoriteMoviesInteractorProtocol
    
    init(withInteractor interactor: FavoriteMoviesInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = String(key: "favorites_title")
    }
    
    override func loadView() {
        super.loadView()
        
        setupLayout()
    }
    
    private func setupLayout() {
        
    }
}
