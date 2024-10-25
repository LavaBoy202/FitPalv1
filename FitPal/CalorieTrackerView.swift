import SwiftUI

struct CaloriesTrackerView: View {
    @EnvironmentObject var appState: AppState  // Access user data for name

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // Header Section
                VStack(alignment: .leading) {
                    Text("Calories Tracker")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    Text("Welcome back, \(appState.userProfile.name)")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.horizontal)

                // Food Sections
                VStack(spacing: 16) {
                    FoodSectionView(title: "Breakfast", foods: appState.foodData.breakfast)
                    FoodSectionView(title: "Lunch", foods: appState.foodData.lunch)
                    FoodSectionView(title: "Dinner", foods: appState.foodData.dinner)
                }
                .padding(.horizontal)

                // Progress Circles Section
                HStack(spacing: 20) {
                    ProgressCircleView(
                        progress: appState.dailyCalories / appState.userProfile.calorieGoal,
                        label: "Calories",
                        color: .green
                    )
                    ProgressCircleView(
                        progress: appState.dailyProtein / appState.userProfile.proteinGoal,
                        label: "Protein",
                        color: .red
                    )
                }
                .padding()
            }
        }
    }
}
