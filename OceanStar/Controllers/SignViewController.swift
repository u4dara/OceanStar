//
//  SignViewController.swift
//  OceanStar
//
//  Created by Udara Sachinthana on 2023-01-01.
//

import UIKit
import MBProgressHUD
import Firebase
import FirebaseFirestore

class SignViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func signupClicked(_ sender: UIButton) {
        view.endEditing(true)
        let name = nameTextField.text
        let email = emailTextField.text
        let password = passwordTextField.text
        let passwordConfirmation = passwordConfirmTextField.text
        
        MBProgressHUD.showAdded(to: view, animated: true)
        delay(durationInSeconds: 1.5){
            MBProgressHUD.hide(for: self.view, animated: true)
            
            guard password == passwordConfirmation else {
                let alert = UIAlertController(title: "Error", message:"Passwords dosen't match", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
                self.present(alert, animated: true)
                return
            }
            
            
            Auth.auth().createUser(withEmail: email!, password: password!) {  authResult, error in
                guard let user = authResult?.user, error == nil else {
                    let alert = UIAlertController(title: "Error", message:error?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
                    self.present(alert, animated: true)
                    return
                }
                
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: ["name": name, "uid": user.uid]) { error in
                    if error != nil {
                        let alert = UIAlertController(title: "Error", message:"Error saving user data!!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
                        self.present(alert, animated: true)
                    }
                }
                
                let storyboard = UIStoryboard(name: K.StoryboardID.Main, bundle: nil)
                let vc = self.storyboard?.instantiateViewController(withIdentifier: K.StoryboardID.mainTabBarController)
                vc?.modalPresentationStyle = .overFullScreen
                self.present(vc!, animated: true)
            }
        }
        
        
    }
    

}
