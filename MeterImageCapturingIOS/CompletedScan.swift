//
//  CompletedScan.swift
//  MeterImageCapturingIOS
//
//  Created by Alexander Powell on 7/10/21.
//

import Foundation

public struct CompletedScan: Codable {
    let machineId: String
    let progressive1: String?
    let progressive2: String?
    let progressive3: String?
    let progressive4: String?
    let progressive5: String?
    let progressive6: String?
    let notes: String?
//    let timestamp: Date?
}
