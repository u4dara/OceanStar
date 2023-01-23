//
//  ListDishesViewController.swift
//  OceanStar
//
//  Created by Udara Sachinthana on 2023-01-24.
//

import UIKit

class ListDishesViewController: UIViewController {

    @IBOutlet weak var dishesTableView: UITableView!
    
    var category:  DishCategory!
    
    var dishes: [Dish] = [
        .init(id: "0001", name: "Popular 01", description: "This is description for popular dishes 1", image: "https://picsum.photos/100/200", calories: 28),
        .init(id: "0002", name: "Popular 02", description: "This is description for popular dishes 2", image: "https://picsum.photos/100/200", calories: 50),
        .init(id: "0003", name: "Popular 03", description: "This is description for popular dishes 3", image: "https://picsum.photos/100/200", calories: 17),
        .init(id: "0004", name: "Popular 04", description: "This is description for popular dishes 4", image: "https://picsum.photos/100/200", calories: 30),
        .init(id: "0005", name: "Popular 05", description: "This is description for popular dishes 5", image: "https://picsum.photos/100/200", calories: 36)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = category.name
        registerCells()
    }

    private func registerCells() {
        dishesTableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDelailsViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
