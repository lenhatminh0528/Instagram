//
//  LoginViewController.swift
//  Instagram
//
//  Created by Le Minh on 10/01/2022.
//

import UIKit

class LoginViewController: UIViewController {

    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    private let usernameEnailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        return UITextField()
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        return field
    }()

    private let loginButton: UIButton = {
        return UIButton()
    }()
    private let createAccountButton: UIButton = {
        return UIButton()
    }()
    private let termButton: UIButton = {
        return UIButton()
    }()
    private let privacyButton: UIButton = {
        return UIButton()
    }()
    
    private let headerView: UIView = {
        return UIView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        view.backgroundColor = .systemBlue
    }
    
    private func addSubviews() {
        view.addSubview(usernameEnailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // assign frames
        
    }
    
    @objc private func didTapLoginButton() {}
    @objc private func didTapTermButton() {}
    @objc private func didTapPrivacyButton() {}
    @objc private func didTapCreateAccount() {}


}
