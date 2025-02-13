//
//  ImagePickerView.swift
//  LeaveApp
//
//  Created by lynkto_1 on 2/13/25.
//


import SwiftUI
import UIKit

struct ImagePickerView: UIViewControllerRepresentable {
    /// The newly picked image file is stored to a temp file, and the URL is returned here.
    @Binding var pickedImageURL: URL?
    
    /// Choose the source (camera or photo library).
    /// If you only want the photo library, set `.photoLibrary`.
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    // MARK: - Coordinator
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePickerView
        
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
        ) {
            guard let uiImage = info[.originalImage] as? UIImage else {
                picker.dismiss(animated: true)
                return
            }
            
            // Create a temporary file path
            let tempDirectory = FileManager.default.temporaryDirectory
            let fileName = UUID().uuidString + ".jpg"
            let fileURL = tempDirectory.appendingPathComponent(fileName)
            
            // Convert UIImage to JPEG data
            if let jpegData = uiImage.jpegData(compressionQuality: 0.8) {
                do {
                    try jpegData.write(to: fileURL, options: .atomic)
                    parent.pickedImageURL = fileURL
                } catch {
                    print("Error writing image to temp URL: \(error)")
                }
            }
            
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}
