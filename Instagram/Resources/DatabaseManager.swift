//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Le Minh on 10/01/

import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database(url: "https://instagram-d0914-default-rtdb.asia-southeast1.firebasedatabase.app").reference()
    
    // Mark - public
    
    public func canCreateNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        completion(true)
    }
    
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void){
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                completion(true)
                return
            }else {
                completion(false)
                return
            }
        }
    }
    
}


