//
//  CircleChartView.swift
//  LeaveApp
//
//  Created by lynkto_1 on 2/13/25.
//

import SwiftUI

struct CircleChartView: View {
    /// Progress from 0.0 (no days) to 1.0 (all days)
    let progress: Double
    /// The thickness of the ring
    let lineWidth: CGFloat
    
    var body: some View {
        ZStack {
            // Background circle (gray)
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: lineWidth)
            
            // Foreground circle (blue) trimmed to the desired fraction
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.blue,
                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                )
                // Rotate so that progress starts from the top (12 o’clock)
                .rotationEffect(.degrees(-90))
        }
    }
}


#Preview {
    CircleChartView(progress: 0.5, lineWidth: 10)
}
