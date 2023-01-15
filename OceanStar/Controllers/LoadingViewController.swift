//
//  LoadingViewController.swift
//  OceanStar
//
//  Created by Udara Sachinthana on 2023-01-01.
//

import UIKit
import Firebase

class LoadingViewController: UIViewController {
    
//    private let isUserLoggedIn = false

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
//        if isUserLoggedIn {
//            PresenterManager.shared.show(vc: .mainTabBarController)
//        }
//        else {
//            performSegue(withIdentifier: K.Segue.showOnboarding, sender: nil)
//        }
        
        checkUserInfo()
    }
    
    private func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            
            let storyboard = UIStoryboard(name: K.StoryboardID.Main, bundle: nil)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: K.StoryboardID.mainTabBarController)
            vc?.modalPresentationStyle = .overFullScreen
            self.present(vc!, animated: true)
        }
        else {
            let storyboard = UIStoryboard(name: K.StoryboardID.Main, bundle: nil)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: K.StoryboardID.onboardingViewController)
            vc?.modalPresentationStyle = .overFullScreen
            self.present(vc!, animated: true)
        }
    }

}
