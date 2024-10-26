//
//  CalorieHistoryView.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-24.
//

import SwiftUI
import Charts

struct CalorieHistoryView: View {
    @State private var selectedTimeframe: Timeframe = .week
    @State private var averageCalories: Int = 2000
    @State private var calorieData: [CalorieData] = [
        // Mock data
        CalorieData(date: "10/1", calories: 1800),
        CalorieData(date: "10/2", calories: 2200),
        CalorieData(date: "10/3", calories: 1900),
        CalorieData(date: "10/4", calories: 2000),
        CalorieData(date: "10/5", calories: 2100),
        CalorieData(date: "10/6", calories: 2300),
        CalorieData(date: "10/7", calories: 2500),
    ]

    var body: some View {
        VStack(alignment: .leading) {
            // Timeframe Toggle
            TimeframeToggle(selectedTimeframe: $selectedTimeframe)
                .padding(.vertical)
            // Average Calories Display
            VStack(alignment: .leading) {
                Text("Daily Average for \(selectedTimeframe.rawValue)")
                    .font(.headline)
                    .padding(.leading)
                Text("\(averageCalories) cal")
                    .font(.system(size: 48, weight: .bold))
                    .padding(.leading)
                Text(timeframeDescription(for: selectedTimeframe))
                    .foregroundColor(.gray)
                    .padding(.leading)
            }
            .padding(.bottom)
            
            // Chart for Calorie Intake
            CalorieChart(data: calorieData)
                .frame(height: 200)
                .padding()
            
            Spacer()
        }
        .padding()
        .onChange(of: selectedTimeframe) { _ in
            updateCalorieData(for: selectedTimeframe)
        }
    }
    
    // Method to update calorie data based on the selected timeframe
    private func updateCalorieData(for timeframe: Timeframe) {
        // Logic to fetch and calculate calorie data based on the selected timeframe
        // Update `averageCalories` and `calorieData` accordingly
        // This is a placeholder and should be replaced with actual data fetching
        averageCalories = 2100  // Update with calculated average
    }
    
    private func timeframeDescription(for timeframe: Timeframe) -> String {
        // Example timeframe descriptions based on selection
        switch timeframe {
        case .day:
            return "Today"
        case .week:
            return "This Week"
        case .month:
            return "This Month"
        case .sixMonths:
            return "Last 6 Months"
        case .year:
            return "This Year"
        }
    }
}

// Enumeration for timeframe selection
enum Timeframe: String, CaseIterable, Identifiable {
    case day = "D"
    case week = "W"
    case month = "M"
    case sixMonths = "6M"
    case year = "Y"
    
    var id: String { self.rawValue }
}
