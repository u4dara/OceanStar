//
//  LoadingViewController.swift
//  OceanStar
//
//  Created by Udara Sachinthana on 2023-01-01.
//

import UIKit

class LoadingViewController: UIViewController {
    
    private let isUserLoggedIn = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delay(durationInSeconds: 1.5) {
            self.showInitialView()
        }
    }
    
    private func showInitialView() {
        if isUserLoggedIn {
            PresenterManager.shared.show(vc: .mainTabBarController)
        }
        else {
            performSegue(withIdentifier: K.Segue.showOnboarding, sender: nil)
        }
    }

}
