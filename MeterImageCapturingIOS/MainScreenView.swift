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
    @ObservedObject var completedScansViewModel = CompletedScansViewModel()
    @StateObject var viewModel = ViewModel()
    
    @State private var machineId: String = ""
    @State private var progressive1: String = ""
    @State private var progressive2: String = ""
    @State private var progressive3: String = ""
    @State private var progressive4: String = ""
    @State private var progressive5: String = ""
    @State private var progressive6: String = ""
    @State private var progressive7: String = ""
    @State private var progressive8: String = ""
    @State private var progressive9: String = ""
    @State private var progressive10: String = ""
    
    var body: some View {
        List {
            Section {
                TextField("Machine ID", text: self.$machineId)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.gray)
                    .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                    .cornerRadius(5)
                Group {
                    TextField("Progressive 1", text: self.$progressive1)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.gray)
                        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                        .textContentType(.password)
                        .cornerRadius(5)
                    TextField("Progressive 2", text: self.$progressive2)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.gray)
                        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                        .textContentType(.password)
                        .cornerRadius(5)
                    TextField("Progressive 3", text: self.$progressive3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.gray)
                        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                        .textContentType(.password)
                        .cornerRadius(5)
                    TextField("Progressive 4", text: self.$progressive4)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.gray)
                        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                        .textContentType(.password)
                        .cornerRadius(5)
                    TextField("Progressive 5", text: self.$progressive5)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.gray)
                        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                        .textContentType(.password)
                        .cornerRadius(5)
                    TextField("Progressive 6", text: self.$progressive6)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.gray)
                        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                        .textContentType(.password)
                        .cornerRadius(5)
                    TextField("Progressive 7", text: self.$progressive7)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.gray)
                        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                        .textContentType(.password)
                        .cornerRadius(5)
                    TextField("Progressive 8", text: self.$progressive8)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.gray)
                        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                        .textContentType(.password)
                        .cornerRadius(5)
                    TextField("Progressive 9", text: self.$progressive9)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.gray)
                        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                        .textContentType(.password)
                        .cornerRadius(5)
                    TextField("Progressive 10", text: self.$progressive10)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.gray)
                        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                        .textContentType(.password)
                        .cornerRadius(5)
                }
            }
        }
        VStack {
            HStack() {
                Button(action: viewModel.takePhoto) {
                    HStack {
                        Text("Scan")
                            .frame(maxWidth: .infinity)
                    }.padding()
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(5)
                    
                }//.padding(.bottom, 40)
                Button(action: processImage) {
                    HStack {
                        Text("Submit")
                            .frame(maxWidth: .infinity)
                    }.padding()
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(5)
                }//.padding(.bottom, 40)
            }
            //controlBar()
        }.padding()
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
    
//    func controlBar() -> some View {
//        HStack(spacing: 32) {
//            Button(action: viewModel.takePhoto, label: {
//                Text("Take a Photo")
//            })
//            Button(action: processImage, label: {
//                Text("Process Image")
//            })
//        }.padding()
//    }
    
    func processImage() {
        let scan = CompletedScann(machineId: "1234", progressive1: "100", progressive2: "200", progressive3: "300", progressive4: "400", progressive5: "500", progressive6: "600", notes: "some notes")
        completedScansViewModel.saveToDatabase(scan: scan)
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
//                print(result.text)
//                print("-----")
                let progressives = self.parseText(blocks: result.blocks)
                print(progressives)
//                result.blocks.forEach { visionTextBlock in
//                    print("-----")
//                    print(visionTextBlock.text)
//                }
//                print(result.text)
            }
        }
        
        private func parseText(blocks: [VisionTextBlock]) -> [String] {
            var ret: [String] = []
            blocks.forEach { visionTextBlock in
                let text = visionTextBlock.text.replacingOccurrences(of: ",", with: "")
                if text.starts(with: "$") || text.starts(with: "S")  {
                    // get substring after $ or S
                    let range = visionTextBlock.text.index(after: text.startIndex)..<text.endIndex
                    if let value = Double(text[range]) {
                        //print(value)
                        ret.append(String(value))
                    } else {
                        print("\(text[range]) is not a number")
                    }
//                    ret.append(visionTextBlock.text)
//                    visionTextBlock.text
//                    if visionTextBlock.text.isInt
//                    visionTextBlock.text.forEach { char in
//                        if char
//                    }
                }
            }
            return ret
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
