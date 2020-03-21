//
//  MoviesListViewController.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 20/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import UIKit

protocol MoviesListNavigationProtocol: class {
    func showMovieDetailVC()
}

class MoviesListViewController: UIViewController {
    
    private var coordinator: MoviesListNavigationProtocol?
    
    init(withCoordinator coordinator: MoviesListNavigationProtocol) {
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
        title = "Movies"
        
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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        littleView.addGestureRecognizer(tapGesture)
    }
    
    @objc func tap() {
//        navigationController?.pushViewController(FavoriteMoviesViewController(), animated: true)
        coordinator?.showMovieDetailVC()
    }
}
