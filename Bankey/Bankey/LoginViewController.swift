//
//  ViewController.swift
//  Bankey
//
//  Created by oussema Hichri on 25/04/2024.
//

import UIKit

class LoginViewController: UIViewController {

  let loginView = LoginView()
  let signInButton = UIButton(type: .system)
  let errorMessageLabel = UILabel()
  let titleLabel = UILabel()
  let subtitleLabel = UILabel()
  
  var username :String? {
    return loginView.userNameTextField.text
  }
  var password: String? {
    return loginView.passwordTextField.text
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    style()
    layout()
  }
}



extension LoginViewController {
  private func style() {
    loginView.translatesAutoresizingMaskIntoConstraints = false
    
    signInButton.translatesAutoresizingMaskIntoConstraints = false
    signInButton.configuration = .filled()
    signInButton.configuration?.imagePadding = 8 // for indicator spacing
    signInButton.setTitle("Sign In", for: [])
    signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
    
    errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
    errorMessageLabel.textAlignment = .center
    errorMessageLabel.textColor = .systemRed
    errorMessageLabel.numberOfLines = 0
    errorMessageLabel.isHidden = false
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.textAlignment = .center
    titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
    titleLabel.adjustsFontForContentSizeCategory = true
    titleLabel.text = "Bankey"

    subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
    subtitleLabel.textAlignment = .center
    subtitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
    subtitleLabel.adjustsFontForContentSizeCategory = true
    subtitleLabel.numberOfLines = 0
    subtitleLabel.text = "Your premium source for all things banking!"
    
  }
  
  private func layout(){
    view.addSubview(titleLabel)
    view.addSubview(subtitleLabel)
    view.addSubview(loginView)
    view.addSubview(signInButton)
    view.addSubview(errorMessageLabel)
    
    //title
    NSLayoutConstraint.activate([
      subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
      titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 1)
    ])
    
    //subtitle
    NSLayoutConstraint.activate([
      loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 1),
      subtitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: subtitleLabel.trailingAnchor, multiplier: 1)
    ])
    
    //Login
    NSLayoutConstraint.activate([
      loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
    ])
    
    //Button
    NSLayoutConstraint.activate([
      signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
      signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
      signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
    ])
    //ErrorMessage
    NSLayoutConstraint.activate([
      errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
      errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
      errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
    ])
  }
}

extension LoginViewController {
  @objc func signInTapped() {
    errorMessageLabel.isHidden = false
    login()
  }
  
  private func login(){
    guard let username = username, let password = password else {
      assertionFailure("Username / password should never be nil")
      return
    }
    
    if username.isEmpty || password.isEmpty {
      configureView(withMessage: "Username / password cannot be blank")
      return
    }
    
    if username == "Tosh" && password == "Katla" {
      signInButton.configuration?.showsActivityIndicator = true
    }else {
      configureView(withMessage: "Incorrect username / password")
    }
  }
  
  private func configureView(withMessage message:String){
    errorMessageLabel.isHidden = false
    errorMessageLabel.text = message
  }
}
