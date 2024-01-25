//
//  WeatherView.swift
//  WeatherAppiOS
//
//  Created by Edvin Mujanovic on 2024-01-24.
//

import SwiftUI

struct WeatherView: View {
    @State private var model = Weathermodels()
    
    var body: some View {
            ScrollView {
                VStack(spacing: 16) {
                    if model.isLoading {
                        ProgressView()
                    } else {
                        if let weeklyModel = model.weeklyWeather.first {
                            ForEach(0..<weeklyModel.date.count, id: \.self) { index in
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Date: \(weeklyModel.date[index])")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    
                                    HStack {
                                        Text("Min Temp:")
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                        Text("\(Int(weeklyModel.minTemp[index]))°C ❄️")
                                            .font(.subheadline)
                                            .foregroundColor(.blue)
                                    }
                                    
                                    HStack {
                                        Text("Max Temp:")
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                        Text("\(Int(weeklyModel.maxTemp[index]))°C ☀️")
                                            .font(.subheadline)
                                            .foregroundColor(.red)
                                    }
                                    
                                    Divider()
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5))
                                .padding(.horizontal, 16)
                            }
                        }
                    }
                }
                .padding(.top, 20)
            }
            .task {
                try? await model.loadWeather()
            }
        }
    
    private func formatDouble(_ value: Double) -> String {
        return String(format: "%.1f", value)
    }
}


#Preview {
    WeatherView()
}
