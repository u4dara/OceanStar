//
//  HomeViewController.swift
//  OceanStar
//
//  Created by Udara Sachinthana on 2023-01-02.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        
    }
    
    private func setupNavigationBar() {
        self.title = K.NavigationTitle.Home
    }

}
