//
//  MainScreenView.swift
//  MeterImageCapturingIOS
//
//  Created by Alexander Powell on 1/30/21.
//

import SwiftUI
//import FirebaseFunctions
import Firebase

struct MainScreenView: View {
    //lazy var functions = Functions.functions()
    @StateObject var viewModel = ViewModel()
    
//    @State private var progressive1: String = ""
//    @State private var progressive2: String = ""
//    @State private var progressive3: String = ""
//    @State private var progressive4: String = ""
//    @State private var progressive5: String = ""
//    @State private var progressive6: String = ""
    
    var body: some View {
//        VStack {
//            List {
//                TextField("Progressive 1", text: $progressive1)
//                TextField("Progressive 2", text: $progressive2)
//                TextField("Progressive 3", text: $progressive3)
//                TextField("Progressive 4", text: $progressive4)
//                TextField("Progressive 5", text: $progressive5)
//                TextField("Progressive 6", text: $progressive6)
//            }
//            .keyboardType(UIKeyboardType.decimalPad)
//            .listStyle(InsetGroupedListStyle())
//            HStack {
//                Button("Scan", action: scan)
//                Spacer()
//                Button("Submit", action: submit)
//            }
//            .buttonStyle(DefaultButtonStyle())
//        }
        VStack(spacing: 32) {
            imageView(for: viewModel.selectedImage)
            controlBar()
        }
        .fullScreenCover(isPresented: $viewModel.isPresentingImagePicker, content: {
            ImagePicker(sourceType: viewModel.sourceType, completionHandler: viewModel.didSelectImage)
        })
    }
    
    @ViewBuilder
    func imageView(for image: UIImage?) -> some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
        }
        else {
            Text("No image selected")
        }
    }
    
    func controlBar() -> some View {
        HStack(spacing: 32) {
            Button(action: viewModel.takePhoto, label: {
                Text("Take a Photo")
            })
            Button(action: processImage, label: {
                Text("Process Image")
            })
        }.padding()
    }
    
    func processImage() {
    }
    
    func scan() {
        
    }
    
    func submit() {
        
    }
    
}

extension MainScreenView {
    final class ViewModel: ObservableObject {
        
        @Published var selectedImage: UIImage?
        @Published var isPresentingImagePicker = false
        private(set) var sourceType: ImagePicker.SourceType = .camera
        
        //lazy var functions = Functions.functions()
        
        func takePhoto() {
            sourceType = .camera
            isPresentingImagePicker = true
        }
        
        func didSelectImage(_ image: UIImage?) {
            selectedImage = image
            isPresentingImagePicker = false
            //
            let vision = Vision.vision()
            let options = VisionCloudTextRecognizerOptions()
            options.languageHints = ["en"]
            let textRecognizer = vision.cloudTextRecognizer(options: options)
            guard let imageData = image?.jpegData(compressionQuality: 1.0) else { return }
            let base64encodedImage = imageData.base64EncodedString()
            let visionImage = VisionImage(image: image!)
            
            textRecognizer.process(visionImage) { result, error in
                guard error == nil, let result = result else {
                    print(error)
                    return
                }
                print(result.text)
            }
        }
        
//        func didSelectImage(_ image: UIImage?) {
//            selectedImage = image
//            isPresentingImagePicker = false
//            //
//            guard let imageData = image?.jpegData(compressionQuality: 1.0) else { return }
//            let base64encodedImage = imageData.base64EncodedString(options: .lineLength64Characters)
//            let requestData = [
//              "image": ["content": base64encodedImage],
//              "features": ["type": "DOCUMENT_TEXT_DETECTION"],
//              "imageContext": ["languageHints": ["en"]]
//            ]
//            functions.httpsCallable("annotateImage").call(requestData) { (result, error) in
//                if let error = error as NSError? {
//                    if error.domain == FunctionsErrorDomain {
//                        let code = FunctionsErrorCode(rawValue: error.code)
//                        let message = error.localizedDescription
//                        let details = error.userInfo[FunctionsErrorDetailsKey]
//                        print(code ?? "empty code")
//                        print(message)
//                        print(details ?? "empty details")
//                    }
//                } else {
//                    // Function completed succesfully
//                    print("Function completed succesfully")
//                    guard let annotation = (result?.data as? [String: Any])?["fullTextAnnotation"] as? [String: Any] else { return }
//                    print("%nComplete annotation:")
//                    let text = annotation["text"] as? String ?? ""
//                    print("%n\(text)")
//                }
//            }
//        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
