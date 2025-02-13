//
//  UpcomingLeaveChartViewModel.swift
//  LeaveApp
//
//  Created by lynkto_1 on 2/13/25.
//



import SwiftUI
import Firebase
import FirebaseFirestore

class UpcomingLeaveChartViewModel: ObservableObject {
    @Published var upcomingDays: Int = 0
    /// Suppose you have a fixed total of 30 leave days per year.
    /// In a real app, this might come from user settings or company policy.
    @Published var totalDays: Int = 30
    
    /// A value between 0.0 and 1.0 indicating how many of the total days are upcoming.
    @Published var progress: Double = 0.3
    
    //private let db = Firestore.firestore()
    
    /*func fetchUpcomingLeaves() {
        let today = Date()
        
        // Example query: get all documents in "leaveApplications"
        // whose startDate is >= today's date (upcoming or current).
        db.collection("leaveApplications")
            .whereField("startDate", isGreaterThanOrEqualTo: today)
            .getDocuments { [weak self] snapshot, error in
                if let error = error {
                    print("Error fetching upcoming leaves: \(error.localizedDescription)")
                    return
                }
                
                guard let documents = snapshot?.documents else {
                    print("No documents found for upcoming leaves.")
                    return
                }
                
                var totalUpcoming = 0
                for doc in documents {
                    let data = doc.data()
                    
                    // If you store dates as Firestore Timestamps:
                    if let startTimestamp = data["startDate"] as? Timestamp,
                       let endTimestamp = data["endDate"] as? Timestamp {
                        
                        let startDate = startTimestamp.dateValue()
                        let endDate   = endTimestamp.dateValue()
                        
                        // Calculate the difference in days (inclusive)
                        // e.g., from 2025-02-10 to 2025-02-12 is 3 days if inclusive
                        let difference = Calendar.current.dateComponents([.day], from: startDate, to: endDate).day ?? 0
                        
                        // We add +1 if you want to count the start day itself
                        // Ensure not to add negative if endDate < startDate for any reason
                        totalUpcoming += max(difference + 1, 0)
                    }
                }
                
                DispatchQueue.main.async {
                    self?.upcomingDays = totalUpcoming
                    self?.updateProgress()
                }
            }
    }*/
    
    private func updateProgress() {
        // Avoid division by zero
        guard totalDays > 0 else {
            progress = 0
            return
        }
        progress = Double(upcomingDays) / Double(totalDays)
    }
}
