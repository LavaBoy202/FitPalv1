//
//  CalorieTrackerView.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-24.
//

import SwiftUICore
import SwiftUI

struct CalorieTrackerView: View {
    @EnvironmentObject var appState: AppState  // Access the shared state

    var body: some View {
        VStack {
            List(appState.foods) { food in
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
            .listStyle(PlainListStyle())
            
            Button(action: {
                appState.addCalories(500)  // Add calories to the daily total
            }) {
                Text("Add 500 Calories")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Text("Total Calories Today: \(appState.dailyCalories)")
                .padding()
        }
    }
}
