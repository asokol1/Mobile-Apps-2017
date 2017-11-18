//
//  LoginViewController.swift
//  socialNetwork
//
//  Created by asokol on 11/9/17.
//  Copyright © 2017 asokol. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
        login()
    }
    
    func login(){
        let user = User(name: nameTextField.text ?? "", password: passwordTextField.text ?? "")
        Networking.sharedNetworking.login(user: user) {(token) in
            DispatchQueue.main.async {
                if token != nil{
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                    self.present(mainVC, animated: true, completion: nil)
                }else{print("failed")}
            }
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    // handling return button should be in "textFieldShouldReturn".
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField{
            passwordTextField.becomeFirstResponder()
        }
        if textField == passwordTextField  && !(nameTextField.text?.isEmpty ?? false) {
            passwordTextField.resignFirstResponder()
            login()
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
}

