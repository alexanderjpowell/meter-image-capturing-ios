//
//  ScanDetailsView.swift
//  MeterImageCapturingIOS
//
//  Created by Alexander Powell on 7/10/21.
//

import SwiftUI

struct ScanDetailsView: View {
    
    let scan: CompletedScann
    @State private var isPresented = false
    
    var body: some View {
        List {
            Section(header: Text("Machine ID")) {
                Text(scan.machineId)
            }
            Section(header: Text("Progressives")) {
                Text("$\(scan.progressive1)")
                Text("$\(scan.progressive2)")
                Text("$\(scan.progressive3)")
                Text("$\(scan.progressive4)")
                Text("$\(scan.progressive5)")
                Text("$\(scan.progressive6)")
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(trailing: Button("Edit") {
            isPresented = true
        })
        .fullScreenCover(isPresented: $isPresented) {
            NavigationView {
                EditScanView(scan: scan)
                    .navigationBarItems(leading: Button("Cancel") {
                        isPresented = false
                    }, trailing: Button("Done") {
                        isPresented = false
                    })
            }
        }
    }
}

struct ScanDetailsView_Previews: PreviewProvider {
    static var scan: CompletedScann = CompletedScann(machineId: "", progressive1: "", progressive2: "", progressive3: "", progressive4: "", progressive5: "", progressive6: "", notes: "")
    static var previews: some View {
        ScanDetailsView(scan: scan)
    }
}
