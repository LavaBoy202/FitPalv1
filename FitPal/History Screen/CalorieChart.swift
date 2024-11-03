//
//  CalorieChart.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-26.
//

import Charts
import SwiftUICore

struct CalorieChart: View {
    var data: [CalorieData]

    var body: some View {
        Chart(data) {
            BarMark(
                x: .value("Date", $0.date),
                y: .value("Calories", $0.calories)
            )
            .foregroundStyle(.blue)
        }
    }
}
