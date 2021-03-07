//
//  MainScreenView.swift
//  MeterImageCapturingIOS
//
//  Created by Alexander Powell on 1/30/21.
//

import SwiftUI

struct MainScreenView: View {
    
    @StateObject var viewModel = ViewModel()
    
    @State private var progressive1: String = ""
    @State private var progressive2: String = ""
    @State private var progressive3: String = ""
    @State private var progressive4: String = ""
    @State private var progressive5: String = ""
    @State private var progressive6: String = ""
    
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
        
        func takePhoto() {
            sourceType = .camera
            isPresentingImagePicker = true
        }
        
        func didSelectImage(_ image: UIImage?) {
            selectedImage = image
            isPresentingImagePicker = false
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
