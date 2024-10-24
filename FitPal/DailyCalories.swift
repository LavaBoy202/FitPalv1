//
//  DailyCalories.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-23.
//

import Foundation

struct DailyCalories: Identifiable, Codable {
    var id = UUID()
    var date: Date
    var totalCalories: Int
}
