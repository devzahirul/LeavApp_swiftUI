//
//  DocumentPickerView.swift
//  LeaveApp
//
//  Created by lynkto_1 on 2/13/25.
//
import SwiftUI
import UniformTypeIdentifiers
import UIKit

struct DocumentPickerView: UIViewControllerRepresentable {
    @Binding var pickedFileURLs: [URL]
    
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        // Accept images, PDFs, or any file.
        let supportedTypes: [UTType] = [UTType.image, UTType.pdf, UTType.item]
        
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes, asCopy: true)
        picker.allowsMultipleSelection = true
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        let parent: DocumentPickerView
        
        init(_ parent: DocumentPickerView) {
            self.parent = parent
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController,
                            didPickDocumentsAt urls: [URL]) {
            parent.pickedFileURLs.append(contentsOf: urls)
        }
        
        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            // Handle cancel if needed
        }
    }
}
