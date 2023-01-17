//
//  Dish.swift
//  OceanStar
//
//  Created by Udara Sachinthana on 2023-01-17.
//

import Foundation

struct Dish {
    let id, name, description, image: String?
    let calories: Int?
    
    var formatedCalories: String {
        return "\(calories ?? 0) calories"
    }
}
