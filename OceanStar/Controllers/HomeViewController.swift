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
    
    var categories: [DishCategory] = [
        .init(id: "0001", name: "Dish 01", image: "https://picsum.photos/100/200"),
        .init(id: "0002", name: "Dish 02", image: "https://picsum.photos/100/200"),
        .init(id: "0003", name: "Dish 03", image: "https://picsum.photos/100/200"),
        .init(id: "0004", name: "Dish 04", image: "https://picsum.photos/100/200"),
        .init(id: "0005", name: "Dish 05", image: "https://picsum.photos/100/200")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        
        categoryCollectionView.delegate = self
    }
    
    private func setupNavigationBar() {
        self.title = K.NavigationTitle.Home
    }

}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: <#T##IndexPath#>) as! CategoryCollectionViewCell
        return cell
    }
}
