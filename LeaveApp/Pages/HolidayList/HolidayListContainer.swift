//
//  HolidayListContainer.swift
//  LeaveApp
//
//  Created by lynkto_1 on 2/14/25.
//

import SwiftUI

struct HolidayListContainer: View {
    
    // Sample holiday data
    var body: some View {
        NavigationView {
            HolidayListView(holidays: Holiday.sampleHolidays)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HolidayListContainer()
    }
}
