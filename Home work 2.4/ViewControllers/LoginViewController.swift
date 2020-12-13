//
//  LoginViewController.swift
//  Home work 2.4
//
//  Created by EKATERINA  KUKARTSEVA on 13.12.2020.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var loginTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var errorLabel: UILabel!
    
    let nextSegue = "seg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginTF.text = ""
        passwordTF.text = ""
        
        errorLabel.isHidden = true
    }
    
    func performAction() {
        if loginTF.text?.count ?? 0 > 0 &&
            passwordTF.text?.count ?? 0 > 0 {
            
            let user = User(login: loginTF.text!, password: passwordTF.text!)
            
            performSegue(withIdentifier: nextSegue, sender: user)
        } else {
            errorLabel.isHidden = false
        }
        
    }
    
    @IBAction func loginAction(_ sender: Any) {
        performAction()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let tabBarController = segue.destination as? UITabBarController,
              let destinationVC = tabBarController.viewControllers?.first as? HomeViewController,
              let user = sender as? User
        else { return }
        
        destinationVC.user = user
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTF {
            passwordTF.becomeFirstResponder()
        } else {
            passwordTF.resignFirstResponder()
            performAction()
        }
        return true
    }
}
