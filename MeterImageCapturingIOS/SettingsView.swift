//
//  SettingsView.swift
//  MeterImageCapturingIOS
//
//  Created by Alexander Powell on 7/11/21.
//

import SwiftUI

struct SettingsView: View {
    
    
    var body: some View {
        List {
            Section {
                Button("Sign Out", action: signOut)
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Settings")
    }
    
    func signOut() {
        AuthState.signOut()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
