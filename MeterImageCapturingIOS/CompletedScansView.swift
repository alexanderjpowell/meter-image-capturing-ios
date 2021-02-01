//
//  CompletedScansView.swift
//  MeterImageCapturingIOS
//
//  Created by Alexander Powell on 1/31/21.
//

import SwiftUI

struct CompletedScansView: View {
    let scans: [ScanModel]
    var body: some View {
        List {
            ForEach(scans) { scan in
                NavigationLink(destination: Text("Details")) {
                    MachineScanCardView(scan: scan)
                }
                
            }
        }
        .navigationTitle("Completed Scans")
    }
}

struct CompletedScansView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CompletedScansView(scans: ScanModel.data)
        }
    }
}
