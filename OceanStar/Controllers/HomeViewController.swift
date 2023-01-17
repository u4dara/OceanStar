//
//  HomeViewController.swift
//  OceanStar
//
//  Created by Udara Sachinthana on 2023-01-02.
//

import UIKit
import Firebase
import FirebaseFirestore

class HomeViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    
    var categories: [DishCategory] = [
        .init(id: "0001", name: "Dish 01", image: "https://picsum.photos/100/200"),
        .init(id: "0002", name: "Dish 02", image: "https://picsum.photos/100/200"),
        .init(id: "0003", name: "Dish 03", image: "https://picsum.photos/100/200"),
        .init(id: "0004", name: "Dish 04", image: "https://picsum.photos/100/200"),
        .init(id: "0005", name: "Dish 05", image: "https://picsum.photos/100/200")
    ]
    
    var popular: [Dish] = [
        .init(id: "0001", name: "Popular 01", description: "This is description for populat dishes 1", image: "https://picsum.photos/100/200", calories: 28),
        .init(id: "0002", name: "Popular 02", description: "This is description for populat dishes 2", image: "https://picsum.photos/100/200", calories: 50),
        .init(id: "0003", name: "Popular 03", description: "This is description for populat dishes 3", image: "https://picsum.photos/100/200", calories: 17),
        .init(id: "0004", name: "Popular 04", description: "This is description for populat dishes 4", image: "https://picsum.photos/100/200", calories: 30),
        .init(id: "0005", name: "Popular 05", description: "This is description for populat dishes 5", image: "https://picsum.photos/100/200", calories: 36)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        
        registerCell()
    }
    
    private func registerCell() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionView.register(UINib(nibName: PopularCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
    }
    
    private func setupNavigationBar() {
        self.title = K.NavigationTitle.Home
    }

}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return popular.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as! PopularCollectionViewCell
            cell.setup(dish: popular[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
    }
}
