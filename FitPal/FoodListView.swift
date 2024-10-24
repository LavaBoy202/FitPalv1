//
//  FoodListView.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-23.
//

import UIKit
import SwiftUICore
import SwiftUI

struct FoodItem: View {
    var food: Food
    @State private var quantity = 0
    
    var body: some View {
        HStack {
            Image(food.image)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            Text(food.name)
            Spacer()
            Stepper(value: $quantity, in: 0...10) {
                Text("\(quantity) servings")
            }
        }
    }
}
