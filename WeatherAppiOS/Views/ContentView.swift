//
//  ContentView.swift
//  WeatherAppiOS
//
//  Created by Edvin Mujanovic on 2024-01-22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            WeatherView()
                .navigationTitle("WeatherApp 🌦")
        }
    }
}

#Preview {
    ContentView()
}
    
    
    
    
    
    
    
    
    
    /*
    @ObservedObject var viewModel = WeatherViewModel()
    @ObservedObject var locationManager = LocationManager()

    var body: some View {
        NavigationView {
            VStack {
                Text("Current Weather")
                    .font(.title)
                    .padding()

                if let weather = viewModel.currentWeather {
                    Text("Temperature: \(weather.current.temperature_2m)°C")
                    Text("Weather Code: \(weather.current.weather_code)")

                    if let currentLocation = locationManager.currentLocation {
                        Text("Location: \(currentLocation.latitude), \(currentLocation.longitude)")
                    }

                    // Add more weather details as needed
                } else {
                    Text("Loading...")
                }

                NavigationLink(
                    destination: ForecastView(),
                    label: {
                        Text("7-Day Forecast")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                )
                .disabled(viewModel.weeklyForecast == nil) // Disable link if forecast data is not available
            }
            .navigationTitle("Weather App")
        }
    }
}

struct ForecastView: View {
    var body: some View {
        Text("7-Day Forecast")
            .font(.title)
            .padding()
            .navigationTitle("Forecast")
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} */

