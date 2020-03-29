//
//  MovieCollectionViewCell.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 27/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell, ConfigurableCell {
    typealias T = DefaultMovieViewModel
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        clipsToBounds = false
    }

    func bind(_ item: DefaultMovieViewModel, at indexPath: IndexPath) {
        titleLabel.text = item.name
    }
}
