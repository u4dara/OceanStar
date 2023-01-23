//
//  DishDelailsViewController.swift
//  OceanStar
//
//  Created by Udara Sachinthana on 2023-01-23.
//

import UIKit

class DishDelailsViewController: UIViewController {
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishNameLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var dish: Dish!

    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
    }
    
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        dishNameLabel.text = dish.name
        caloriesLabel.text = dish.formatedCalories
        descriptionLabel.text = dish.description
    }

    @IBAction func addFavouriteButtonClicked(_ sender: UIButton) {
        
        
    }
    
    
}
