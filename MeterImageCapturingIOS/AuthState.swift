//
//  AuthState.swift
//  MeterImageCapturingIOS
//
//  Created by Alexander Powell on 7/11/21.
//

import Foundation
import Firebase


class AuthState: ObservableObject {
    
    @Published var user: User?// = nil
    private var authStateHandler: AuthStateDidChangeListenerHandle?
    
    init() {
        addListeners()
    }
    
    static func signin() {
        Auth.auth().signIn(withEmail: "test@gmail.com", password: "password") { authResult, error in
        }
    }
    
    static func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    private func addListeners() {
        if let handle = authStateHandler {
            Auth.auth().removeStateDidChangeListener(handle)
        }
        
        authStateHandler = Auth.auth()
            .addStateDidChangeListener { auth, user in
                self.user = user
            }
    }
}
