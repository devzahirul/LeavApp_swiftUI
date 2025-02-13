//
//  BackendService.swift
//  LeaveApp
//
//  Created by lynkto_1 on 2/13/25.
//

// BackendService.swift

import Foundation

protocol BackendService {
    /// Submits a leave application to the backend.
    /// - Parameters:
    ///   - application: The leave application model.
    ///   - completion: A completion handler returning either success or error.
    func submitLeaveApplication(
        _ application: LeaveApplication,
        completion: @escaping (Result<Void, Error>) -> Void
    )
}

class MockBackendService: BackendService {
    func submitLeaveApplication(_ application: LeaveApplication, completion: @escaping (Result<Void, any Error>) -> Void) {
        
    }
}
