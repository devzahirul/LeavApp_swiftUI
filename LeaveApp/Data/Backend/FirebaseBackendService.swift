//
//  FirebaseBackendService.swift
//  LeaveApp
//
//  Created by lynkto_1 on 2/13/25.
//
// FirebaseBackendService.swift

import Firebase
import FirebaseFirestore
import Foundation

class FirebaseBackendService: BackendService {
    
    private let db = Firestore.firestore()
    
    func submitLeaveApplication(
        _ application: LeaveApplication,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        // Convert the application to a dictionary that Firestore can handle
        let data: [String: Any] = [
            "name": application.name,
            "email": application.email,
            "leaveType": application.leaveType,
            "startDate": application.startDate,
            "endDate": application.endDate,
            "reason": application.reason
        ]
        
        // Add a new document to the "leaveApplications" collection
        db.collection("leaveApplications").addDocument(data: data) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
