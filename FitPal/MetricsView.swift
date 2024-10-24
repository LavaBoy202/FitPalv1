//
//  MetricsView.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-24.
//

import SwiftUICore

struct MetricsView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            Text("Average Calories: \(appState.dailyCalories / 7)")  // Example calculation
            Text("Streak: 5 days")  // You can implement real streak logic here
            Text("Estimated Weight Loss: 0.5 lbs")
        }
        .padding()
    }
}
