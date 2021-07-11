//
//  CompletedScansView.swift
//  MeterImageCapturingIOS
//
//  Created by Alexander Powell on 1/31/21.
//

import Foundation
import SwiftUI

struct CompletedScann: Identifiable {
    let id = UUID().uuidString
    var machineId: String
    let progressive1: String
    let progressive2: String
    let progressive3: String
    let progressive4: String
    let progressive5: String
    let progressive6: String
    let notes: String
//    let timestamp: Date?
}

struct CompletedScansView: View {
    
    @ObservedObject var viewModel = CompletedScansViewModel()
    
    var body: some View {
        List(viewModel.scans) { scan in
            NavigationLink(destination: ScanDetailsView(scan: scan)) {
                MachineScanCardView(scan: scan)
            }
        }
        .navigationTitle("Completed Scans")
        .onAppear() {
            self.viewModel.fetchData()
        }
    }
}

struct CompletedScansView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedScansView()
    }
}
