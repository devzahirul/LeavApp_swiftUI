//
//  HolidayList.swift
//  LeaveApp
//
//  Created by lynkto_1 on 2/13/25.
//



import SwiftUI


struct HolidayListView: View {
    let holidays: [Holiday]
    let calendar = Calendar.current
    
    var body: some View {
        // Filter out holidays that are already past
        let upcomingHolidays = holidays.filter { $0.daysRemaining() >= 0 }
        
        List(upcomingHolidays) { holiday in
            HStack {
                // Circular date display
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 50, height: 50)
                    
                    Text("\(calendar.component(.day, from: holiday.date))")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding(.trailing, 8)
                
                // Holiday name and remaining days
                VStack(alignment: .leading, spacing: 4) {
                    Text(holiday.name)
                        .font(.headline)
                    
                    Text(holiday.remainingDaysText())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.vertical, 4)
        }
        .navigationTitle("Holidays")
    }
}

#Preview {
    HolidayListView(holidays: Holiday.sampleHolidays)
}
