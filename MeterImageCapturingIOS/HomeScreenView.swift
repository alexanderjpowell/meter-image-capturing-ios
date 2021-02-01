//
//  HomeScreenView.swift
//  MeterImageCapturingIOS
//
//  Created by Alexander Powell on 1/31/21.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Manage Progressives")) {
                    NavigationLink(destination: MainScreenView()) {
                        Label("Scan Machine", systemImage: "camera")
                            .font(.headline)
                            .foregroundColor(.accentColor)
                            .accessibilityLabel(Text("Start meeting"))
                    }
                    NavigationLink(destination: CompletedScansView(scans: ScanModel.data)) {
                        Label("Completed Scans", systemImage: "doc")
                    }
                }
                Section(header: Text("Users")) {
                    Label("User 1", systemImage: "person")
                    Label("User 2", systemImage: "person")
                    Label("User 3", systemImage: "person")
                    Label("User 4", systemImage: "person")
                }
                NavigationLink(destination: MainScreenView()) {
                    Label("Settings", systemImage: "gear")
                        .font(.headline)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("MiC")
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
