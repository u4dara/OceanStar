//
//  LoginViewController.swift
//  OceanStar
//
//  Created by Udara Sachinthana on 2023-01-01.
//

import UIKit
import Firebase
import MBProgressHUD

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginClicked(_ sender: UIButton) {
        login()
    }
    
    func login() {
        view.endEditing(true)
        MBProgressHUD.showAdded(to: view, animated: true)
        delay(durationInSeconds: 1.5) {
            MBProgressHUD.hide(for: self.view, animated: true)
            Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) {  [weak self] authResult, error in
                guard let strongSelf = self else { return }
                if let err = error {

                    let alert = UIAlertController(title: "Error", message:error?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
                    self!.present(alert, animated: true)
                }
                self!.checkUserInfo()
            }
        }
    }
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            
            let storyboard = UIStoryboard(name: K.StoryboardID.Main, bundle: nil)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: K.StoryboardID.mainTabBarController)
            vc?.modalPresentationStyle = .overFullScreen
            self.present(vc!, animated: true)
        }
    }
    
    

}
