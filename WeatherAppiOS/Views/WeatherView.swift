//
//  WeatherView.swift
//  WeatherAppiOS
//
//  Created by Edvin Mujanovic on 2024-01-24.
//

import SwiftUI

struct WeatherView: View {
    @State private var locationManager = LocationManager()
    @State private var model = Weathermodels(locationManager: LocationManager())
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Display Current Weather
                if let currentModel = model.currentWeather.first {
                    VStack {
                        Text("Current Weather 🌦")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.top, 10)
                        
                        Text("Date: \(currentModel.date)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text("Temperature: \(Int(currentModel.temp))°C")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5))
                    .padding(.horizontal, 16)
                }
                // Weekly Forecast
                Text("Weekly Forecast 📆")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, 20)
                
                if model.isLoading {
                    ProgressView()
                } else {
                    if let weeklyModel = model.weeklyWeather.first {
                        ForEach(0..<weeklyModel.date.count, id: \.self) { index in
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Date: \(weeklyModel.dayOfWeek[index])")
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
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        )
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
