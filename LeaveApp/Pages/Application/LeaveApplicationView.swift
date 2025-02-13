//
//  LeaveApplicationView.swift
//  LeaveApp
//
//  Created by lynkto_1 on 2/13/25.
//
import SwiftUI

struct LeaveApplicationView: View {
    @StateObject private var viewModel = LeaveApplicationViewModel()
    
    // For presenting the document picker
    @State private var isDocumentPickerPresented = false
    
    // For presenting the image picker
    @State private var isImagePickerPresented = false
    
    // Temporary storage for the new image URL from ImagePicker
    @State private var tempPickedImageURL: URL? = nil
    
    var body: some View {
        NavigationView {
            Form {
                // --- Personal Information ---
                Section(header: Text("Personal Information")) {
                    TextField("Name", text: $viewModel.application.name)
                        .textContentType(.name)
                    
                    TextField("Email", text: $viewModel.application.email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                }
                
                // --- Leave Details ---
                Section(header: Text("Leave Details")) {
                    Picker("Leave Type", selection: $viewModel.application.leaveType) {
                        ForEach(viewModel.leaveTypes, id: \.self) { type in
                            Text(type)
                        }
                    }
                    
                    DatePicker("Start Date", selection: $viewModel.application.startDate, displayedComponents: .date)
                    DatePicker("End Date", selection: $viewModel.application.endDate, displayedComponents: .date)
                    
                    TextField("Reason for Leave", text: $viewModel.application.reason)
                }
                
                // --- Attachments ---
                Section(header: Text("Attachments")) {
                    // Show a list of current attachments
                    if viewModel.attachedFileURLs.isEmpty {
                        Text("No attachments yet.")
                            .foregroundColor(.secondary)
                    } else {
                        ForEach(viewModel.attachedFileURLs, id: \.self) { fileURL in
                            Text(fileURL.lastPathComponent)
                                .lineLimit(1)
                        }
                    }
                    
                    // Buttons to pick image or document
                    HStack {
                        Button("Add Document") {
                            isDocumentPickerPresented = true
                        }
                        Spacer()
                        Button("Add Image") {
                            isImagePickerPresented = true
                        }
                    }
                }
                
                // --- Submission ---
                Section {
                    Button("Submit") {
                        viewModel.submitForm()
                    }
                    
                    if let message = viewModel.submissionMessage {
                        Text(message)
                            .foregroundColor(message.contains("success") ? .green : .red)
                            .padding(.top, 4)
                    }
                }
            }
            .navigationTitle("Leave Application")
            
            // Present the Document Picker
            .sheet(isPresented: $isDocumentPickerPresented) {
                DocumentPickerView(pickedFileURLs: $viewModel.attachedFileURLs)
            }
            
            // Present the Image Picker
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePickerView(pickedImageURL: $tempPickedImageURL)
            }
            // Whenever tempPickedImageURL changes, add it to the ViewModel array
            .onChange(of: tempPickedImageURL) { newValue in
                guard let newValue = newValue else { return }
                viewModel.attachedFileURLs.append(newValue)
                tempPickedImageURL = nil  // Reset the temp state
            }
        }
    }
}

struct LeaveApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        LeaveApplicationView()
    }
}
