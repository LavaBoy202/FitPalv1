//
//  FoodSectionView.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-25.
//

import SwiftUICore
import SwiftUI

struct FoodSectionView: View {
    var title: String
    var foods: [Food]  // Array of foods for each meal

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .bold()
                .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(foods) { food in
                        VStack {
                            Image(food.image)  // Replace with actual image asset
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                            
                            Text(food.name)
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
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
