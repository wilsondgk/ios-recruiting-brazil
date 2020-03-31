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
    func viewDidLoad()
}

class FavoriteMoviesViewController: UIViewController, FavoriteMoviesViewProtocol {

    private let interactor: FavoriteMoviesInteractorProtocol
    private var favoriteMoviesDataSource: FavoriteMoviesCollectionViewDataSource?
    
    //MARK: UIComponents
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(FavoriteMovieCollectionViewCell.self, forCellWithReuseIdentifier: FavoriteMovieCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = UIColor.white
        
        return collectionView
    }()
    
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
        interactor.viewDidLoad()
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let provider = CoreDataProvider(withContext: appDelegate.persistentContainer.viewContext)
//        let data = MovieData(context: appDelegate.persistentContainer.viewContext)
//        data.id = 10
//        data.name = "wilson"
//        provider.saveObject(data, successCompletion: {
//            print("======= ssssss")
//        }) { (error) in
//            print("======= eeeeeee")
//        }
    }
    
    private func setupLayout() {
        view.addSubview(equalConstraintsFor: collectionView)
    }
    
    //MARK: FavoriteMoviesViewProtocol
    func updateFavoriteMovies(withViewModels viewModels: [FavoriteMovieViewModel]) {
        favoriteMoviesDataSource = FavoriteMoviesCollectionViewDataSource(collectionView: collectionView, array: viewModels)
        collectionView.reloadData()
    }
}
