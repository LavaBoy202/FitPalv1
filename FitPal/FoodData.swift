//
//  FoodData.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-24.
//

import SwiftUICore

class FoodData: ObservableObject {
    @Published var foods: [Food] = [
        Food(name: "Apple", calories: 95, image: "apple.png"),
        Food(name: "Banana", calories: 105, image: "banana.png")
    ]
}
