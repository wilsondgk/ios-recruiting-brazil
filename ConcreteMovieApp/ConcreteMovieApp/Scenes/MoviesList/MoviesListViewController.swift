//
//  MoviesListViewController.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 20/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import UIKit

class MoviesListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        title = "Movies"
        tabBarItem = UITabBarItem(title: "Movies", image: UIImage(named:"movie_list_icon") , tag: 0)
        setupLayout()
    }
    
    private func setupLayout() {
        let littleView = UIView()
        littleView.backgroundColor = Colors.marineBlue
        view.addSubview(littleView, constraints: [
            littleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            littleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            littleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            littleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}
