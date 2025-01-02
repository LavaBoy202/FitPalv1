import FirebaseFirestore

class UserModel {
    var uid: String
    var email: String
    var name: String
    var goalCalories: Int
    var goalWeight: Double
    var weight: Double
    var height: Double
    var createdAt: Date?

    // Default initializer
    init() {
        self.uid = ""
        self.email = ""
        self.name = ""
        self.goalCalories = 0
        self.goalWeight = 0.0
        self.weight = 0.0
        self.height = 0.0
        self.createdAt = nil
    }

    // Custom initializer with user data
    init(userData: [String: Any]) {
        // Convert uid and email to strings
        self.uid = userData["uid"] as? String ?? ""
        self.email = userData["email"] as? String ?? ""
        
        // Convert name to string
        self.name = userData["name"] as? String ?? ""
        
        // Convert goalCalories from string to Int (if needed)
        if let goalCaloriesString = userData["goalCalories"] as? String,
           let goalCaloriesInt = Int(goalCaloriesString) {
            self.goalCalories = goalCaloriesInt
        } else {
            self.goalCalories = userData["goalCalories"] as? Int ?? 0
        }
        
        // Convert goalWeight from string to Double (if needed)
        if let goalWeightString = userData["goalWeight"] as? String,
           let goalWeightDouble = Double(goalWeightString) {
            self.goalWeight = goalWeightDouble
        } else {
            self.goalWeight = userData["goalWeight"] as? Double ?? 0.0
        }
        
        // Convert weight from string to Double (if needed)
        if let weightString = userData["weight"] as? String,
           let weightDouble = Double(weightString) {
            self.weight = weightDouble
        } else {
            self.weight = userData["weight"] as? Double ?? 0.0
        }
        
        // Convert height from string to Double (if needed)
        if let heightString = userData["height"] as? String,
           let heightDouble = Double(heightString) {
            self.height = heightDouble
        } else {
            self.height = userData["height"] as? Double ?? 0.0
        }
        
        // Handle createdAt timestamp and convert it to Date
        if let createdAtTimestamp = userData["createdAt"] as? Timestamp {
            self.createdAt = createdAtTimestamp.dateValue()
        } else {
            self.createdAt = nil
        }
    }
}

