//
//  PopularCollectionViewCell.swift
//  OceanStar
//
//  Created by Udara Sachinthana on 2023-01-17.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PopularCollectionViewCell"
    
    @IBOutlet weak var titleTextField: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesTextField: UILabel!
    @IBOutlet weak var descriptionTextField: UILabel!
    
    func setup(dish: Dish) {
        titleTextField.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesTextField.text = dish.formatedCalories
        descriptionTextField.text = dish.description
    }

}
