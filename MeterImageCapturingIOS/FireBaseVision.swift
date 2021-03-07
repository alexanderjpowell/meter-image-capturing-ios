//
//  FireBaseVision.swift
//  MeterImageCapturingIOS
//
//  Created by Alexander Powell on 3/7/21.
//

import SwiftUI
import FirebaseFunctions

private func myFunc() {
    let test = UIImage()
    guard let imageData = test.jpegData(compressionQuality: 1.0) else { return }
    let base64encodedImage = imageData.base64EncodedString()
    let functions = Functions.functions()
    let requestData = [
      "image": ["content": base64encodedImage],
      "features": ["type": "TEXT_DETECTION"],
      "imageContext": ["languageHints": ["en"]]
    ]
    
    functions.httpsCallable("annotateImage").call(requestData) { (result, error) in
        if let error = error as NSError? {
            if error.domain == FunctionsErrorDomain {
                //let code = FunctionsErrorCode(rawValue: error.code)
                let message = error.localizedDescription
                //let details = error.userInfo[FunctionsErrorDetailsKey]
                //print(code)
                print(message)
                //print(details)
            }
        }
        // Function completed succesfully
        print("Function completed succesfully")
    }
}
