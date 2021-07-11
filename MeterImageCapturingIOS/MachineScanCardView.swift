//
//  MachineScanCardView.swift
//  MeterImageCapturingIOS
//
//  Created by Alexander Powell on 1/31/21.
//

import SwiftUI

struct MachineScanCardView: View {
    let scan: CompletedScann
    var body: some View {
        VStack {
            Text("Machine ID: \(scan.machineId)")
                .font(.caption2)
                .foregroundColor(.gray)
            HStack {
                Text("$\(scan.progressive1)")
                Text("$\(scan.progressive2)")
                Text("$\(scan.progressive3)")
            }
            HStack {
                Text("$\(scan.progressive4)")
                Text("$\(scan.progressive5)")
                Text("$\(scan.progressive6)")
            }
        }
//        VStack(alignment: .leading) {
//            HStack {
//            Text("Machine ID")
//                .font(.caption2)
//                .foregroundColor(.gray)
//            Spacer()
//            Text("5 minutes ago")
//                .font(.footnote)
//                .foregroundColor(Color.blue)
//            }
//            HStack {
//                Text("12345678")
//                    .font(.headline)
//
//            }
//            VStack {
//                HStack {
//                    Text("$123.45")
//                    Text("$123.45")
//                    Text("$123.45")
//                }
//                HStack {
//                    Text("$123.45")
//                    Text("$123.45")
//                    Text("$123.45")
//                }
//            }
//            .font(.caption)
//            .foregroundColor(Color.green)
//        }
        //.padding()
    }
}

struct MachineScanCardView_Previews: PreviewProvider {
    //static var scan = ScanModel.data[0]
    static var scan: CompletedScann = CompletedScann(machineId: "", progressive1: "", progressive2: "", progressive3: "", progressive4: "", progressive5: "", progressive6: "", notes: "")
    static var previews: some View {
        MachineScanCardView(scan: scan)
            //.previewLayout(.fixed(width: 400, height: 60))
    }
}
