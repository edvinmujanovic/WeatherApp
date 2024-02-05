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
    
    private func formatDateString(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        
        if let date = dateFormatter.date(from: dateString) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateFormat = "EEE, MMM d"
            return displayFormatter.string(from: date)
        }
        
        return nil
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                // Current Weather
                if let currentModel = model.currentWeather {
                    VStack(spacing: 10) {
                        Text("Today")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        Text("Current Weather 🌦")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("\(Int(currentModel.temp))°")
                            .font(.system(size: 70, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        
                        Text("\(locationManager.address?.locality ?? "Unknown")")
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.blue).opacity(0.8).shadow(radius: 10))
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
                
                // Weekly Forecast
                Text("Weekly Forecast 📆")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                if model.isLoading {
                    ProgressView()
                } else {
                    if let weeklyModel = model.weeklyWeather.first {
                        ForEach(0..<weeklyModel.date.count, id: \.self) { index in
                            HStack {
                                Text(formatDateString(weeklyModel.date[index]) ?? "")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .frame(width: 70)

                                
                                Text("\(Int(weeklyModel.minTemp[index]))°/\(Int(weeklyModel.maxTemp[index]))°")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.blue).opacity(0.8).shadow(radius: 5))
                            .padding(.horizontal, 20)
                        }
                    }
                }
            }
        }
        .task {
            try? await model.loadWeather()
        }
        
    }
}

private func formatDouble(_ value: Double) -> String {
    return String(format: "%.1f", value)
}



struct WeatherViewCompact: View {
    @AppStorage(DataStoring.tempKey, store: UserDefaults(suiteName: DataStoring.SharedStorage)) private var currentTemperature: Double = 5.0
    
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Weather🌦:")
                .font(.headline)
                .foregroundColor(.black)
            
            VStack {
                Text("\(Int(currentTemperature))°C")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color(.lightGray)).shadow(radius: 5))
            .padding(.horizontal, 4)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color(.cyan)).shadow(radius: 5))
        .padding(.horizontal, 4)
    }
}




#Preview {
    WeatherView()
    //WeatherViewCompact()
}
