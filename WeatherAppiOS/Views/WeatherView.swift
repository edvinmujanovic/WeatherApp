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
            displayFormatter.dateFormat = "MMM dd, yyyy HH:mm"
            return displayFormatter.string(from: date)
        }
        
        return nil
    }
    
    var body: some View {
        ZStack {
            Image("background1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 16) {
                    // Display Current Weather
                    if let currentModel = model.currentWeather {
                        VStack {
                            Text("Current Weather 🌦")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                                .padding(.top, 10)
                            
                            if let formattedDate = formatDateString(currentModel.date) {
                                Text("\(formattedDate)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Text("\(Int(currentModel.temp))°C")
                                .font(.system(size: 70, weight: .bold, design: .rounded))
                                .foregroundColor(.black)
                            
                            // Display current city
                            Text("\(locationManager.address?.locality ?? "Unknown")")
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white).shadow(radius: 10))
                        .padding(.horizontal, 20)
                    }
                    
                    // Weekly Forecast
                    Text("Weekly Forecast 📆")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
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
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white).shadow(radius: 10))
                                .padding(.horizontal, 20)
                            }
                        }
                    }
                }
                .padding(.top, 20)
            }
            .background(Color.clear) // Make ScrollView background clear to see the image
        }
        .task {
            try? await model.loadWeather()
        }
    }
    
    private func formatDouble(_ value: Double) -> String {
        return String(format: "%.1f", value)
    }
}


struct WeatherViewCompact: View {
    @AppStorage(DataStoring.tempKey, store: UserDefaults(suiteName: DataStoring.SharedStorage)) private var currentTemperature: Double = 5.0

    var body: some View {
        HStack(spacing: 4) {
            VStack(spacing: 0) {
                Text("\(Int(currentTemperature))°C")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Right Now") 
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)).shadow(radius: 5))
            VStack(spacing: 0) {

                Image(systemName: "cloud.sun.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                Text("Weather")
                    .font(.caption)
                    .foregroundColor(.white)
            }
        }
        .padding(8)
        .background(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(gradient: Gradient(colors: [Color(.cyan), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)).shadow(radius: 5))
    }
}








#Preview {
    WeatherView()
}
