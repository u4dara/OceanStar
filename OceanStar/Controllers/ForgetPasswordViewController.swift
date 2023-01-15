//
//  ForgetPasswordViewController.swift
//  OceanStar
//
//  Created by Udara Sachinthana on 2023-01-02.
//

import UIKit
import Firebase
import MBProgressHUD

class ForgetPasswordViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func submitClicked(_ sender: UIButton) {
        view.endEditing(true)
        MBProgressHUD.showAdded(to: view, animated: true)
        
        delay(durationInSeconds: 2) {
            MBProgressHUD.hide(for: self.view, animated: true)
            
            let auth = Auth.auth()
            
            auth.sendPasswordReset(withEmail: self.emailTextField.text!) { (error) in
                if let error = error {
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
                    self.present(alert, animated: true)
                    return
                }
                
                let alert = UIAlertController(title: "Hurray", message:"A Password reset link has been sent successfully!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
                self.present(alert, animated: true)
                return
            }
        }
    }

}
