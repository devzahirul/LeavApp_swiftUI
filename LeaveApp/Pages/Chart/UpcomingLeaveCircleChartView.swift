//
//  UpcomingLeaveCircleChartView.swift
//  LeaveApp
//
//  Created by lynkto_1 on 2/13/25.
//

import SwiftUI

struct UpcomingLeaveCircleChartView: View {
    @StateObject private var viewModel = UpcomingLeaveChartViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Upcoming Leave Days")
                .font(.title)
            
            // Circle chart
            CircleChartView(progress: viewModel.progress, lineWidth: 20)
                .frame(width: 200, height: 200)
            
            // Numeric display of upcoming days
            Text("\(viewModel.upcomingDays) / \(viewModel.totalDays) days")
                .font(.headline)
                .foregroundColor(.primary)
            
            // An optional button to refresh (could also rely on .onAppear only)
            Button("Refresh") {
                //viewModel.fetchUpcomingLeaves()
            }
            .padding(.top, 8)
        }
        .onAppear {
            // Fetch data on first appearance
            //viewModel.fetchUpcomingLeaves()
        }
    }
}


#Preview {
    UpcomingLeaveCircleChartView()
}
