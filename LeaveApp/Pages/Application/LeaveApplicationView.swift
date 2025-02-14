//
//  LeaveApplicationView.swift
//  LeaveApp
//
//  Created by lynkto_1 on 2/13/25.
//
import SwiftUI

struct LeaveApplicationView: View {
    @StateObject private var viewModel = LeaveApplicationViewModel()
    
    @State private var isDocumentPickerPresented = false
    @State private var isImagePickerPresented    = false
    @State private var tempPickedImageURL: URL?  = nil
    
    @Environment(\.locale) var local
    
    var body: some View {
        NavigationView {
            Form {
                //--- Language section----
                //LanguagePickerSection()
                
                
                // --- Personal Information ---
                Section(header: Text(.personalInformation)) {
                    TextField(.namePlaceholder, text: $viewModel.application.name)
                        .textContentType(.name)
                    
                    TextField(.emailPlaceholder, text: $viewModel.application.email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                }
                
                // --- Leave Details ---
                Section(header: Text(.leaveDetails)) {
                    Picker(.init(.leaveDetails), selection: $viewModel.application.leaveType) {
                        ForEach(viewModel.leaveTypes, id: \.self) { type in
                            // If these "type" strings also need localization,
                            // either localize them similarly or handle them differently
                            Text(type)
                        }
                    }
                    
                    DatePicker(.init(.startDate),
                               selection: $viewModel.application.startDate,
                               displayedComponents: .date)
                    DatePicker(.init(.endDate),
                               selection: $viewModel.application.endDate,
                               displayedComponents: .date)
                    
                    TextField(.reasonForLeave, text: $viewModel.application.reason)
                }
                
                // --- Attachments ---
                Section(header: Text(.attachments)) {
                    if viewModel.attachedFileURLs.isEmpty {
                        Text(.noAttachments)
                            .foregroundColor(.secondary)
                    } else {
                        ForEach(viewModel.attachedFileURLs, id: \.self) { fileURL in
                            Text(fileURL.lastPathComponent)
                                .lineLimit(1)
                        }
                    }
                    
                    HStack {
                        Button(.addDocument) {
                            isDocumentPickerPresented = true
                        }
                        Spacer()
                        Button(.addImage) {
                            isImagePickerPresented = true
                        }
                    }
                }
                
                // --- Submission ---
                Section {
                    Button(.submitButton) {
                        viewModel.submitForm()
                    }
                    
                    if let message = viewModel.submissionMessage {
                        Text(message)  // Possibly localize or style further
                            .foregroundColor(message.contains("success") ? .green : .red)
                            .padding(.top, 4)
                    }
                }
            }
            .navigationTitle(Text(.leaveApplicationTitle))
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    LanguagePickerSection()
                }
            })
            // Document Picker
            .sheet(isPresented: $isDocumentPickerPresented) {
                DocumentPickerView(pickedFileURLs: $viewModel.attachedFileURLs)
            }
            
            // Image Picker
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePickerView(pickedImageURL: $tempPickedImageURL)
            }
            .onChange(of: tempPickedImageURL) { newValue in
                guard let newValue = newValue else { return }
                viewModel.attachedFileURLs.append(newValue)
                tempPickedImageURL = nil
            }
        }.id(local)
    }
}


struct LeaveApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        LeaveApplicationView()
    }
}
