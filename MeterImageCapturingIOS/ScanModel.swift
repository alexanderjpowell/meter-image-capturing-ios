//
//  ScanModel.swift
//  MeterImageCapturingIOS
//
//  Created by Alexander Powell on 1/31/21.
//

import SwiftUI

struct ScanModel: Identifiable {
    let id: UUID
    var machineId: String
    var location: String
    var progressive1: Double
    var progressive2: Double
    var progressive3: Double
    var progressive4: Double
    var progressive5: Double
    var progressive6: Double
    var notes: String
    
    init(id: UUID = UUID(), machineId: String, location: String, progressive1: Double, progressive2: Double, progressive3: Double, progressive4: Double, progressive5: Double, progressive6: Double, notes: String) {
        self.id = id
        self.machineId = machineId
        self.location = location
        self.progressive1 = progressive1
        self.progressive2 = progressive2
        self.progressive3 = progressive3
        self.progressive4 = progressive4
        self.progressive5 = progressive5
        self.progressive6 = progressive6
        self.notes = notes
    }
}

extension ScanModel {
    static var data: [ScanModel] {
        [
            ScanModel(machineId: "12345678", location: "Sample Location 1", progressive1: 10.0, progressive2: 20.0, progressive3: 30.0, progressive4: 40.0, progressive5: 50.0, progressive6: 60.0, notes: "notes"),
            ScanModel(machineId: "87654321", location: "Sample Location 2", progressive1: 10.0, progressive2: 20.0, progressive3: 30.0, progressive4: 40.0, progressive5: 50.0, progressive6: 60.0, notes: "notes"),
            ScanModel(machineId: "55555555", location: "Sample Location 3", progressive1: 10.0, progressive2: 20.0, progressive3: 30.0, progressive4: 40.0, progressive5: 50.0, progressive6: 60.0, notes: "notes"),
            ScanModel(machineId: "12345678", location: "Sample Location 1", progressive1: 10.0, progressive2: 20.0, progressive3: 30.0, progressive4: 40.0, progressive5: 50.0, progressive6: 60.0, notes: "notes"),
            ScanModel(machineId: "87654321", location: "Sample Location 2", progressive1: 10.0, progressive2: 20.0, progressive3: 30.0, progressive4: 40.0, progressive5: 50.0, progressive6: 60.0, notes: "notes"),
            ScanModel(machineId: "55555555", location: "Sample Location 3", progressive1: 10.0, progressive2: 20.0, progressive3: 30.0, progressive4: 40.0, progressive5: 50.0, progressive6: 60.0, notes: "notes"),
            ScanModel(machineId: "12345678", location: "Sample Location 1", progressive1: 10.0, progressive2: 20.0, progressive3: 30.0, progressive4: 40.0, progressive5: 50.0, progressive6: 60.0, notes: "notes"),
            ScanModel(machineId: "87654321", location: "Sample Location 2", progressive1: 10.0, progressive2: 20.0, progressive3: 30.0, progressive4: 40.0, progressive5: 50.0, progressive6: 60.0, notes: "notes"),
            ScanModel(machineId: "55555555", location: "Sample Location 3", progressive1: 10.0, progressive2: 20.0, progressive3: 30.0, progressive4: 40.0, progressive5: 50.0, progressive6: 60.0, notes: "notes"),
        ]
    }
}
