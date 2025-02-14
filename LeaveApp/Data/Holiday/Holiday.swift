//
//  Holiday.swift
//  LeaveApp
//
//  Created by lynkto_1 on 2/14/25.
//

import Foundation

struct Holiday: Identifiable {
    let id = UUID()
    let name: String
    let date: Date
}

extension Holiday {
    /// Returns the number of days remaining from today until the holiday's date.
    /// Negative if the holiday is in the past.
    func daysRemaining() -> Int {
        let calendar = Calendar.current
        let startOfToday = calendar.startOfDay(for: Date())
        let startOfHoliday = calendar.startOfDay(for: self.date)
        let components = calendar.dateComponents([.day], from: startOfToday, to: startOfHoliday)
        return components.day ?? 0
    }
    
    /// Returns a user-friendly string describing how many days are left until the holiday.
    func remainingDaysText() -> String {
        let daysLeft = daysRemaining()
        
        if daysLeft < 0 {
            return "This holiday was \(-daysLeft) days ago"
        } else if daysLeft == 0 {
            return "Today is the holiday!"
        } else {
            return "\(daysLeft) day(s) remaining"
        }
    }
}

extension Holiday {
    // Helper to easily create a Date from components
    private static func dateFromComponents(year: Int, month: Int, day: Int) -> Date {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        return Calendar.current.date(from: components) ?? Date()
    }
    
     static var sampleHolidays: [Holiday] {
        [
            Holiday(name: "New Year", date: dateFromComponents(year: 2025, month: 1, day: 1)),
            Holiday(name: "Valentine's Day", date: dateFromComponents(year: 2025, month: 2, day: 14)),
            Holiday(name: "Independence Day", date: dateFromComponents(year: 2025, month: 7, day: 4)),
            Holiday(name: "Halloween", date: dateFromComponents(year: 2025, month: 10, day: 31)),
            Holiday(name: "Christmas", date: dateFromComponents(year: 2025, month: 12, day: 25))
        ]
    }
}
