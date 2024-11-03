//
//  TimeFrameToggle.swift
//  FitPal
//
//  Created by Lavan Nithi on 2024-10-26.
//

import SwiftUICore

struct TimeframeToggle: View {
    @Binding var selectedTimeframe: Timeframe
    
    var body: some View {
        HStack {
            ForEach(Timeframe.allCases) { timeframe in
                Text(timeframe.rawValue)
                    .font(.headline)
                    .foregroundColor(selectedTimeframe == timeframe ? .white : .blue)
                    .padding()
                    .background(selectedTimeframe == timeframe ? Color.blue : Color.clear)
                    .cornerRadius(8)
                    .onTapGesture {
                        selectedTimeframe = timeframe
                    }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}
