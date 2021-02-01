//
//  MainScreenView.swift
//  MeterImageCapturingIOS
//
//  Created by Alexander Powell on 1/30/21.
//

import SwiftUI

struct MainScreenView: View {
    
    @State private var progressive1: String = ""
    @State private var progressive2: String = ""
    @State private var progressive3: String = ""
    @State private var progressive4: String = ""
    @State private var progressive5: String = ""
    @State private var progressive6: String = ""
    
    var body: some View {
        VStack {
            List {
                TextField("Progressive 1", text: $progressive1)
                TextField("Progressive 2", text: $progressive2)
                TextField("Progressive 3", text: $progressive3)
                TextField("Progressive 4", text: $progressive4)
                TextField("Progressive 5", text: $progressive5)
                TextField("Progressive 6", text: $progressive6)
            }
            .keyboardType(UIKeyboardType.decimalPad)
            .listStyle(InsetGroupedListStyle())
            HStack {
                Button("Scan", action: scan)
                Spacer()
                Button("Submit", action: submit)
            }
            .buttonStyle(DefaultButtonStyle())
        }
    }
    
    func scan() {
        
    }
    
    func submit() {
        
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
