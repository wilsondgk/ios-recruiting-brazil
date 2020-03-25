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

protocol MoviesListInteractorProtocol: class {
    func viewDidLoad()
}

class MoviesListViewController: BaseViewController, MoviesListViewProtocol {
    
    private let interactor: MoviesListInteractorProtocol
    
    init(withInteractor interactor: MoviesListInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        title = String(key: "movies_title")
        
        setupLayout()
    }
    let littleView = UIView()
    private func setupLayout() {
        
        
        littleView.backgroundColor = Colors.marineBlue
//        littleView.setState(.empty(emptyMessage: "error error error error error error error error error error ", image: UIImage(named: "search_icon")))
//        littleView.setState(.loading(loadingMessage: "wilson\nwilson\nwilson\nwilson\n"))
        view.addSubview(littleView, constraints: [
            littleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            littleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            littleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            littleView.heightAnchor.constraint(equalToConstant: 100)
//            littleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        littleView.addGestureRecognizer(tapGesture)
    }
    
    
    var iterator = 0
    @objc func tap() {
        switch iterator % 4 {
        case 0:
            showLoadingInView(withMessage: "Wilson Kim Wilson Kim Wilson Kim \nWilson Kim Wilson Kim ")
        case 1:
            showError(nil, title: "Título")
        case 2:
            setNormalLayout()
        case 3:
            setNormalLayout()
        default:
            showLoading()
        }
        iterator += 1
        view.bringSubviewToFront(littleView)
    }
    
    //MARK: MoviesListViewProtocol
    func showLoading() {
        
    }
}
