//
//  SpecialCollectionViewCell.swift
//  OceanStar
//
//  Created by Udara Sachinthana on 2023-01-23.
//

import UIKit

class SpecialCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: SpecialCollectionViewCell.self)
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    func setup(dish: Dish) {
        foodImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formatedCalories
    }
}
