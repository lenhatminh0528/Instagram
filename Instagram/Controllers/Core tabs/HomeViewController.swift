//
//  ViewController.swift
//  Instagram
//
//  Created by Le Minh on 10/01/2022.
//
import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
    }

    private func handleNotAuthenticated() {
        //check auth status
        if Auth.auth().currentUser == nil {
            //show login
            // check auth status
            if Auth.auth().currentUser == nil {
                //Show log in
                let loginVC = LoginViewController()
                loginVC.modalPresentationStyle = .fullScreen
                present(loginVC, animated: false)
            }
        }
    }
}

