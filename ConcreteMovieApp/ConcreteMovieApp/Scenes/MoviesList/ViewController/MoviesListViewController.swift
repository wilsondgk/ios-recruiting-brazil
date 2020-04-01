//
//  MoviesListViewController.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 20/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import UIKit

protocol MoviesListInteractorProtocol: class {
    func viewDidLoad()
    func didClickInMovie(atIndex indexPath: IndexPath)
}

final class MoviesListViewController: BaseViewController, MoviesListViewProtocol {
    
    //MARK: UIComponents
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = UIColor.white
        
        return collectionView
    }()
    private var moviesDataSource: DefaultMovieDataSource?
    
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
        title = String(key: "movies_title")
        
        interactor.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(equalConstraintsFor: collectionView)
    }
    
    //MARK: MoviesListViewProtocol
    
    func updateMovies(withMoviesViewModel viewModels: [DefaultMovieViewModel]) {
        moviesDataSource = DefaultMovieDataSource(collectionView: collectionView, array: viewModels)
        moviesDataSource?.collectionItemSelectionHandler = { [weak self] indexPath in
            guard let strongSelf = self else { return }
            strongSelf.interactor.didClickInMovie(atIndex: indexPath)
        }
        collectionView.reloadData()
    }
}
