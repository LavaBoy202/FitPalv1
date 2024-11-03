import SwiftUI

import SwiftUI

struct MetricsOverviewView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        ScrollView {  // Wrap everything in a ScrollView to avoid vertical centering
            VStack(alignment: .center) {
                // Title Section
                Text("Designed to take your dreams and make them a reality")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top, 20)

                // Description Section
                Text("Here goes a motivational description that aligns with your fitness journey and helps you track your progress daily.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.vertical, 20)

                // Metrics Grid Section
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 20) {
                    // First Metric - Streak
                    MetricItemView(icon: "flame.fill", title: "Streak", description: "\(appState.streakDays) days", iconColor: .orange)

                    // Second Metric - Calories
                    MetricItemView(icon: "fork.knife", title: "Calories", description: "\(appState.dailyCalories) KCal/day", iconColor: .green)

                    // Third Metric - Weight Loss
                    MetricItemView(icon: "scalemass.fill", title: "Weight Loss", description: "1 lb/week", iconColor: .blue)

                    // Fourth Metric - Net Calories
                    MetricItemView(icon: "arrow.up.arrow.down", title: "Net Calories", description: "-200 calories", iconColor: .purple)
                }
                .padding(.horizontal)
                
                Spacer()  // This spacer pushes content to the top
            }
            .frame(maxWidth: .infinity, alignment: .top) // Align content to the top
            .padding()
        }
    }
}

// Subview for Metric Item in Grid
struct MetricItemView: View {
    let icon: String
    let title: String
    let description: String
    let iconColor: Color

    var body: some View {
        VStack {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.primary)

            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(iconColor)
                .padding(.bottom, 5)

            Text(description)
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
