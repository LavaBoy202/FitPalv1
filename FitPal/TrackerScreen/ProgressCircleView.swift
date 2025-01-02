//
//  ProgressCircleView.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-25.
//

import SwiftUICore

struct ProgressCircleView: View {
    var progress: Double  // Value between 0.0 and 1.0 representing the progress
    var label: String
    var color: Color

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 10)
                    .opacity(0.3)
                    .foregroundColor(color)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                    .stroke(color, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.easeInOut)
                
//                Text("\(Int(progress * 100))%")
//                    .font(.title2)
//                    .bold()
//                    .foregroundColor(color)
            }
            .frame(width: 100, height: 100)

            Text(label)
                .font(.headline)
        }
    }
}
