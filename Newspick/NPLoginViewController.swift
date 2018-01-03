//
//  NPLoginViewController.swift
//  Newspick
//
//  Created by JonLu on 12/27/17.
//  Copyright © 2017 JonLu. All rights reserved.
//

import UIKit

class NPLoginViewController: UIViewController {
  
  @IBOutlet weak var loginTextLabel: UILabel!
  @IBOutlet weak var emailTextLabel: UILabel!
  @IBOutlet weak var passwordTextLabel: UILabel!
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  @IBOutlet weak var loginButton: UIButton!
  
  var loginButtonIsEnabled = false
  
  @IBAction func loginButtonPressed(_ sender: UIButton) {
    if loginButtonIsEnabled {
      UtilityFunction.showLoadingHud("Loading")
      loginButtonIsEnabled = false
      // legal username : admin@newspick.com
      // legal password : 123
      // Delay 4 seconds
      DispatchQueue.main.asyncAfter(deadline: .now() + 4.0, execute: {
        NetworkingService.loginService(userName: self.loginTextLabel.text!, password: self.passwordTextLabel.text!, completionHandle: {
          // Use Stub to simulate login response
          // but if type username: admin@newspick.com pwd: 123
          // will guarantee log in successfully
          if LoginStub.testLoginSuccessUsingStub() || (self.emailTextField.text == LoginStub.legalUserName && self.passwordTextField.text == LoginStub.legalPassword) {
            let storyboard = UIStoryboard.init(name: "NPFaceIconCanvasViewController", bundle: nil)
            let faceIconViewController = storyboard.instantiateViewController(withIdentifier: StoryboardID.faceIconCanvasStoryboardID)
            self.emailTextField.resignFirstResponder()
            self.passwordTextField.resignFirstResponder()
            self.present(UtilityFunction.showAlert(title: "Success", message: "Successfully Log In!", showCancel: false), animated: true, completion: nil)
            
            // Show success notification dismiss after 1 second
            // push to Face Icon scene
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
              self.dismiss(animated: true, completion: {
                self.present(faceIconViewController, animated: true, completion: nil)
              })
            })
          }
          else {
            self.present(UtilityFunction.showAlert(title: "Error", message: "User Not Found!", showCancel: true), animated: true, completion: nil)
          }
        })
      })
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configure()
    setupUI()
  }
  
  func setupUI() {
    self.view.backgroundColor = UIColor.black
    loginButton.backgroundColor = UIColor(red: 1.0, green: 0.8, blue: 0.6, alpha: 1.0)
  }
  
  func configure() {
    self.emailTextField.delegate = self
    self.passwordTextField.delegate = self
    
    setupTextFieldsToCheckIfEmpty()
  }
  
  func setupTextFieldsToCheckIfEmpty() {
    self.emailTextField.addTarget(self, action: #selector(checkTextFieldsIfEmpty(sender:)), for: .editingChanged)
    self.passwordTextField.addTarget(self, action: #selector(checkTextFieldsIfEmpty(sender:)), for: .editingChanged)
  }
  
  func checkTextFieldsIfEmpty(sender: UITextField) {
    sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
    
    guard
      let email = emailTextField.text, !email.isEmpty,
      let password = passwordTextField.text, !password.isEmpty
      else {
        loginButton.backgroundColor = UIColor(red: 1.0, green: 0.8, blue: 0.6, alpha: 1.0)
        loginButtonIsEnabled = false
        return
    }
    loginButtonIsEnabled = true
    loginButton.backgroundColor = UIColor(red: 1.0, green: 0.6, blue: 0.0, alpha: 1.0)
  }
}


extension NPLoginViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
}
