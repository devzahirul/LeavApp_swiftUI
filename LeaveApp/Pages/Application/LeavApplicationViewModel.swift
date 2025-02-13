//
//  LeavApplicationViewModel.swift
//  LeaveApp
//
//  Created by lynkto_1 on 2/13/25.
//

// LeaveApplicationViewModel.swift

import SwiftUI
import Combine

class LeaveApplicationViewModel: ObservableObject {
    @Published var application: LeaveApplication
    @Published var submissionMessage: String?
    
    let leaveTypes: [String] = ["Sick Leave", "Casual Leave", "Earned Leave", "Other"]
    
    // Reference to our backend service
    private let backendService: BackendService
    
    // Store references to chosen attachment file URLs
       @Published var attachedFileURLs: [URL] = []
    
    
    // Initialize the ViewModel with a given backend service
    init(backendService: BackendService = MockBackendService()) {
        self.backendService = backendService
        self.application = LeaveApplication(
            name: "",
            email: "",
            leaveType: "Sick Leave",
            startDate: Date(),
            endDate: Date(),
            reason: ""
        )
    }
    
    func submitForm() {
        // Basic validations
        guard !application.name.isEmpty else {
            submissionMessage = "Name is required."
            return
        }
        
        guard isValidEmail(application.email) else {
            submissionMessage = "Enter a valid email address."
            return
        }
        
        guard application.endDate >= application.startDate else {
            submissionMessage = "End date cannot be earlier than start date."
            return
        }
        
        // If validations pass, submit to the backend
        backendService.submitLeaveApplication(application) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.submissionMessage = "Form submitted successfully!"
                    
                case .failure(let error):
                    self?.submissionMessage = "Submission failed: \(error.localizedDescription)"
                }
            }
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }
}

