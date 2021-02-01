//
//  SignInView.swift
//  MeterImageCapturingIOS
//
//  Created by Alexander Powell on 1/30/21.
//

import SwiftUI
import Firebase

struct SignInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack() {
            Image("mic_logo")
                .resizable()
                .frame(width: 180.0, height: 180.0)
                .scaledToFit()
            ZStack(alignment: .leading) {
                if email.isEmpty {
                    Text("Email")
                        .padding()
                        .foregroundColor(.white)
                }
                TextField("", text: self.$email)
                    .padding()
                    .cornerRadius(20.0)
            }
            ZStack(alignment: .leading) {
                if password.isEmpty {
                    Text("Password")
                        .padding()
                        .foregroundColor(.white)
                }
                SecureField("", text: self.$password)
                    .padding()
                    .cornerRadius(20.0)
            }
            Button(action: signin) {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.gray)
                    .cornerRadius(15.0)
            }
            /*Button(action: signout) {
                Text("Sign Out")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
            }*/
        }
        .frame(maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
        
    }
    
    func signin() {
        //Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            //print(authResult)
        //}
    }
    
    func signout() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
