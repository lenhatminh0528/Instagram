//
//  AuthManager.swift
//  Instagram
//
//  Created by Le Minh on 10/01/2022.
//

import FirebaseDatabase
import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    // MARK: -Public
    public func registerNewUser(_ userName: String,_ email:String,_ password: String, completion: @escaping (Bool) -> Void){
        /*
         - check if username is available
         - check if email is available
      
         */
        
        DatabaseManager.shared.canCreateNewUser(with: userName, username: email) { canCreate in
            if canCreate {
//                - create account
//                - insert account to database
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
//                    print("createuser: \(result)")
                    guard error == nil, result != nil else {
                        completion(false)
                        return
                    }
                    
                    // insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: userName) { inserted in
                        if inserted {
                            completion(true)
                        } else {
                            completion(false)
                        }
                        return
                    }
                }
            }else {
                completion(false)
            }
        }
        
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            // email login

            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        } else if let username = username {
            print("\(username)")
        }
    }
    
}
