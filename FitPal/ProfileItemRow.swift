//
//  ProfileItemRow.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-24.
//

import SwiftUICore

struct ProfileItemRow: View {
    var iconName: String  // System icon name
    var title: String     // Item title (e.g., "Height", "Weight")
    var value: String     // Value (e.g., "170 cm", "65 kg")

    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: iconName)  // Display the system icon
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)  // Color for the icon

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(value)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 8)

            Spacer()
        }
        .padding(.vertical, 8)  // Padding for the row
    }
}
