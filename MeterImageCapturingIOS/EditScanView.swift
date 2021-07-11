//
//  EditScanView.swift
//  MeterImageCapturingIOS
//
//  Created by Alexander Powell on 7/10/21.
//

import SwiftUI

struct EditScanView: View {
    
    @State var scan: CompletedScann
    
    var body: some View {
        List {
            Section(header: Text("Machine ID")) {
                TextField("Machine ID", text: $scan.machineId)
            }
            Section(header: Text("Progressives")) {
                Text(scan.progressive1)
                Text(scan.progressive2)
                Text(scan.progressive3)
                Text(scan.progressive4)
                Text(scan.progressive5)
                Text(scan.progressive6)
            }
        }.listStyle(InsetGroupedListStyle())
    }
}

struct EditScanView_Previews: PreviewProvider {
    static var scan: CompletedScann = CompletedScann(machineId: "", progressive1: "", progressive2: "", progressive3: "", progressive4: "", progressive5: "", progressive6: "", notes: "")
    static var previews: some View {
        EditScanView(scan: scan)
    }
}
