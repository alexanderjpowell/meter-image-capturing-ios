//
//  HomeScreenView.swift
//  MeterImageCapturingIOS
//
//  Created by Alexander Powell on 1/31/21.
//

import SwiftUI
import Firebase

struct HomeScreenView: View {
    
    @ObservedObject var authService = AuthState()
    
    var body: some View {
        
        if authService.user == nil {
            SignInView()
        } else {
            NavigationView {
                List {
                    Section(header: Text("Manage Progressives")) {
                        NavigationLink(destination: MainScreenView()) {
                            Label("Scan Machine", systemImage: "camera")
                                .font(.headline)
                                .foregroundColor(.accentColor)
                                .accessibilityLabel(Text("Start meeting"))
                        }
                        NavigationLink(destination: CompletedScansView()) {
                            Label("Completed Scans", systemImage: "doc")
                        }
                    }
                    Section(header: Text("Users")) {
                        Label("User 1", systemImage: "person")
                        Label("User 2", systemImage: "person")
                        Label("User 3", systemImage: "person")
                        Label("User 4", systemImage: "person")
                    }
                    NavigationLink(destination: SettingsView()) {
                        Label("Settings", systemImage: "gear")
                            .font(.headline)
                    }
                    
                }
    //            .onAppear(perform: self.printUser)
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("MiC")
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
    func printUser() {
//        if (Auth.auth().currentUser == nil) {
//            print("Not signed in")
//        } else {
//            print("UID: \(Auth.auth().currentUser?.uid)")
//        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
