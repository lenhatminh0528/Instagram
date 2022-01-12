//
//  LoginViewController.swift
//  Instagram
//
//  Created by Le Minh on 10/01/2022.
//
import SafariServices
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
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password..."
        field.returnKeyType = .done
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x:0, y:0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.isSecureTextEntry = true
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Create an Account", for: .normal)
        return button
    }()
    private let termButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Term of service", for: .normal)
        return button
    }()
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Privacy Policy", for: .normal)
        return button
    }()
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        return header
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccount), for: .touchUpInside)
        termButton.addTarget(self, action: #selector(didTapTermButton), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)
        
        usernameEnailField.becomeFirstResponder()
        usernameEnailField.delegate = self
        passwordField.delegate = self
        addSubviews()
        view.backgroundColor = .systemBackground
        
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
        headerView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height/3.0)
        usernameEnailField.frame = CGRect(x: 25, y: headerView.bottom + 40, width: view.width - 50, height: 52.0)
        passwordField.frame = CGRect(x: 25, y: usernameEnailField.bottom + 10, width: view.width - 50, height: 52.0)
        loginButton.frame = CGRect(x: 25, y: passwordField.bottom + 10, width: view.width - 50, height: 52.0)
        createAccountButton.frame = CGRect(x: 25, y: loginButton.bottom + 20, width: view.width - 50, height: 52.0)
        //term button on the bottom of view
        termButton.frame = CGRect(x: 10, y:view.height - view.safeAreaInsets.bottom - 100, width: view.width - 20, height: 52.0)
        privacyButton.frame = CGRect(x: 10, y:view.height - view.safeAreaInsets.bottom - 50, width: view.width - 20, height: 52.0)
        configureHeaderView()
        
        self.hideKeyboardWhenTappedAround()
        
    }
    
    private func configureHeaderView(){
        guard headerView.subviews.count == 1 else {
            return
        }
        guard let backgroundView = headerView.subviews.first else {
            return
        }
        backgroundView.frame = headerView.bounds
        
        //add instagram logo
        let imageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4.0,
                                 y: headerView.height/2.0 - 50,
                                 width: headerView.width/2.0,
                                 height: 150)
        
    }
    
    @objc private func didTapLoginButton() {
        passwordField.resignFirstResponder()
        usernameEnailField.resignFirstResponder()
        self.hideKeyboardWhenTappedAround()
        guard let userNameEmail = usernameEnailField.text, !userNameEmail.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8 else {
                  return
              }
        print("userName: \(userNameEmail), pass: \(password)")
        print("login")
    }
    @objc private func didTapTermButton() {
        guard let url = URL(string: "https://help.instagram.com/581066165581870") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        print("term")
    }
    @objc private func didTapPrivacyButton() {
        guard let url = URL(string: "https://help.instagram.com/519522125107875?helpref=page_content") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        print("Privacy")
    }
    @objc private func didTapCreateAccount() {
        let vc = RegistrationViewController()
        present(vc, animated: true)
        print("create Account")
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textF1: \(textField)")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textF: \(textField)")
        if textField == usernameEnailField {
            passwordField.becomeFirstResponder()    // focus
        } else if textField == passwordField {
            
            didTapLoginButton()
        
        }
        return true
    }
}

