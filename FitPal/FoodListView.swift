//
//  FoodListView.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-24.
//

import SwiftUICore
import SwiftUI

struct FoodListView: View {
    @StateObject var foodData = FoodData()

    var body: some View {
        List(foodData.foods) { food in
            HStack {
                Image(food.image)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Text(food.name)
                Spacer()
                Text("\(food.calories) cal")
            }
        }
    }
}
