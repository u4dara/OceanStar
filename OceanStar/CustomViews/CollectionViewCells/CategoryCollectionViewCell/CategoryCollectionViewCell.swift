//
//  CategoryCollectionViewCell.swift
//  OceanStar
//
//  Created by Udara Sachinthana on 2023-01-16.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    func setup(category: DishCategory) {
        categoryLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image.asUrl)
    }
}
