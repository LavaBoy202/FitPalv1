//
//  FoodListView.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-24.
//

import SwiftUICore
import SwiftUI

struct FoodContentView: View {
    @StateObject var foodData = FoodData()  // Use @StateObject in the top-level view

    var body: some View {
        VStack {
            FoodListView(title: "Breakfast", foods: foodData.breakfast)
            FoodListView(title: "Lunch", foods: foodData.lunch)
            FoodListView(title: "Dinner", foods: foodData.dinner)
        }
    }
}

struct FoodListView: View {
    var title: String
    var foods: [Food]  // Directly pass the food array for breakfast, lunch, or dinner

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(foods) { food in
                        VStack {
                            Image(food.image)  // Image name should match the asset catalog
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                            Text(food.name)
                                .font(.subheadline)
                            Text("\(food.calories) cal")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .frame(width: 100)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
