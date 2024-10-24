//
//  FoodDataModel.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-23.
//

import Foundation

struct Food: Identifiable, Codable {
    var id = UUID()
    var name: String
    var calories: Int
    var image: String
}
