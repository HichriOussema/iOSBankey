//
//  LoginView.swift
//  Bankey
//
//  Created by oussema Hichri on 25/04/2024.
//

import Foundation
import UIKit

class LoginView: UIView {
  

  let stackView = UIStackView()
  let userNameTextField = UITextField()
  let passwordTextField = UITextField()
  let divider = UIView ()
  
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    style()
    layout()
  }
  
  required init?(coder:NSCoder){
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension LoginView {
  
  func style(){
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .secondarySystemBackground
  
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 8
    
    userNameTextField.translatesAutoresizingMaskIntoConstraints = false
    userNameTextField.delegate = self
    userNameTextField.placeholder = "Username"
    
    passwordTextField.translatesAutoresizingMaskIntoConstraints = false
    passwordTextField.delegate = self
    passwordTextField.placeholder = "Password"
    passwordTextField.isSecureTextEntry = true
    
    divider.translatesAutoresizingMaskIntoConstraints = false
    divider.backgroundColor = .secondarySystemFill
    
    layer.cornerRadius = 10
    clipsToBounds = true
    
  }
  
  func layout(){
    addSubview(stackView)
    
    stackView.addArrangedSubview(userNameTextField)
    stackView.addArrangedSubview(divider)
    stackView.addArrangedSubview(passwordTextField)
    
    //StackView
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
      stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
      trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
      bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
    ])
    
    //Divider view (the line)
    divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
  }
}

// MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    userNameTextField.endEditing(true)
    passwordTextField.endEditing(true)
    return true
  }
  
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    return true
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
  
  }
}
