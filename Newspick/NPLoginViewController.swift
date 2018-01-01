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
      print("Trying ... log in")
      UtilityFunction.showLoadingHud("Loading")
      
      // TODO
      let storyboard = UIStoryboard.init(name: "NPFaceIconCanvasViewController", bundle: nil)
      let vc = storyboard.instantiateViewController(withIdentifier: StoryboardID.faceIconCanvasStoryboardID)
      present(vc, animated: true, completion: nil)
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
