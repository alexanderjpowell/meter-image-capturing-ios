//
//  CompletedScansViewModel.swift
//  MeterImageCapturingIOS
//
//  Created by Alexander Powell on 5/31/21.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class CompletedScansViewModel: ObservableObject {
    
    @Published var scans = [CompletedScann]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("scans").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                var ret: [CompletedScann] = []
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let machineId = data["machine_id"] as? String ?? ""
                    let progressive1 = data["progressive1"] as? String ?? ""
                    let progressive2 = data["progressive2"] as? String ?? ""
                    let progressive3 = data["progressive3"] as? String ?? ""
                    let progressive4 = data["progressive4"] as? String ?? ""
                    let progressive5 = data["progressive5"] as? String ?? ""
                    let progressive6 = data["progressive6"] as? String ?? ""
                    let notes = data["notes"] as? String ?? ""
                    ret.append(CompletedScann(machineId: machineId,
                                                     progressive1: progressive1,
                                                     progressive2: progressive2,
                                                     progressive3: progressive3,
                                                     progressive4: progressive4,
                                                     progressive5: progressive5,
                                                     progressive6: progressive6,
                                                     notes: notes))
                }
                self.scans = ret
            }
        }
    }
    
    func saveToDatabase(scan: CompletedScann) {
        let data = [
            "machine_id": scan.machineId,
            "progressive1": scan.progressive1,
            "progressive2": scan.progressive2,
            "progressive3": scan.progressive3,
            "progressive4": scan.progressive4,
            "progressive5": scan.progressive5,
            "progressive6": scan.progressive6,
            "notes": scan.notes
        ]
        db.collection("scans").addDocument(data: data)
    }
}

struct Scan: Identifiable {
    var id: String = UUID().uuidString
    var progressive1: Int
}
