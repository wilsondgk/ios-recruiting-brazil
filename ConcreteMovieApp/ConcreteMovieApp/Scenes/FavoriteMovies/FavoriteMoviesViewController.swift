//
//  FavoriteMoviesViewController.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 20/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import UIKit

class FavoriteMoviesViewController: UIViewController {

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
    }
}
