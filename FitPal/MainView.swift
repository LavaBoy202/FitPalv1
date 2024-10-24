//
//  MainView.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            NavigationView {
                CalorieTrackerView()
                    .navigationTitle("Calories Tracker")
            }
            .tabItem {
                Image(systemName: "flame.fill")
                Text("Tracker")
            }

            NavigationView {
                CalorieHistoryView()
                    .navigationTitle("History")
            }
            .tabItem {
                Image(systemName: "chart.bar.fill")
                Text("History")
            }

            NavigationView {
                MetricsView()
                    .navigationTitle("Metrics")
            }
            .tabItem {
                Image(systemName: "gauge")
                Text("Metrics")
            }

            NavigationView {
                ProfileView()
                    .navigationTitle("Profile")
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
        }
    }
}
