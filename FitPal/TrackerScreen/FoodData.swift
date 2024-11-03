//
//  FoodData.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-24.
//

import SwiftUICore

class FoodData: ObservableObject {
    @Published var breakfast: [Food] = [
        Food(name: "Eggs", calories: 155, image: "eggs"),
        Food(name: "Toast", calories: 80, image: "toast"),
        Food(name: "Orange Juice", calories: 112, image: "orange_juice")
    ]
    
    @Published var lunch: [Food] = [
        Food(name: "Chicken Salad", calories: 300, image: "chicken_salad"),
        Food(name: "Soup", calories: 150, image: "soup"),
        Food(name: "Rice", calories: 200, image: "rice")
    ]
    
    @Published var dinner: [Food] = [
        Food(name: "Steak", calories: 500, image: "steak"),
        Food(name: "Potato", calories: 150, image: "potato"),
        Food(name: "Broccoli", calories: 50, image: "broccoli")
    ]
}
