//
//  SettingsViewController.swift
//  OceanStar
//
//  Created by Udara Sachinthana on 2023-01-01.
//

import UIKit
import Firebase
import MBProgressHUD

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.title = K.NavigationTitle.Settings
    }
    
    @IBAction func logoutClicked(_ sender: UIBarButtonItem) {
        MBProgressHUD.showAdded(to: view, animated: true)
        
        delay(durationInSeconds: 1.5) {
            MBProgressHUD.hide(for: self.view, animated: true)
            
            let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            PresenterManager.shared.show(vc: .onboarding)
        } catch(let error) {
            let alert = UIAlertController(title: "Error", message:error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            self.present(alert, animated: true)
        }
            
            
        }
    }
}
