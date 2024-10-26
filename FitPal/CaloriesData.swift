//
//  CaloriesData.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-26.
//

import Foundation

struct CalorieData: Identifiable {
    let id = UUID()
    let date: String
    let calories: Int
}
