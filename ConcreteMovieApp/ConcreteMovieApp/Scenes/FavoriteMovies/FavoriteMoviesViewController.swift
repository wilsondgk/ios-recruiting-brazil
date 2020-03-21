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

class FavoriteMoviesViewController: UIViewController {

    private var coordinator: FavoriteMoviesNavigationProtocol
    
    init(withCoordinator coordinator: FavoriteMoviesNavigationProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        title = "Favorites"
        
        setupLayout()
    }
    
    private func setupLayout() {
        let littleView = UIView()
        littleView.backgroundColor = .darkGray
        view.addSubview(littleView, constraints: [
            littleView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            littleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            littleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            littleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        littleView.addGestureRecognizer(tapGesture)
    }
    
    @objc func tap() {
        coordinator.showFavoriteMovieDetail()
    }
}
