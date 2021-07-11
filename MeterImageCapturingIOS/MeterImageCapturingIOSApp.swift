//
//  MeterImageCapturingIOSApp.swift
//  MeterImageCapturingIOS
//
//  Created by Alexander Powell on 1/30/21.
//

import SwiftUI
import Firebase
//import FirebaseCore
//import FirebaseFirestore

@main
struct MeterImageCapturingIOSApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            HomeScreenView()
        }
    }
}
