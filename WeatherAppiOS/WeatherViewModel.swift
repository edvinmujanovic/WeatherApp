//
//  WeatherViewModel.swift
//  WeatherAppiOS
//
//  Created by Edvin Mujanovic on 2024-01-23.
//

import Foundation
/*
class WeatherViewModel: ObservableObject {
    @Published var currentWeather: WeatherModel?
    @Published var weeklyForecast: [WeatherModel.Daily]?

    private let locationManager = LocationManager()
    private let apiManager = APIManager()

    init() {
        fetchCurrentWeather()
        fetchWeeklyForecast()
    }

    func fetchCurrentWeather() {
        guard let userLocation = locationManager.currentLocation else { return }

        apiManager.fetchCurrentWeather(latitude: userLocation.latitude, longitude: userLocation.longitude) { result in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    self.currentWeather = weather
                }
            case .failure:
                // Handle error if needed
                break
            }
        }
    }

    func fetchWeeklyForecast() {
        guard let userLocation = locationManager.currentLocation else { return }

        apiManager.fetchWeeklyForecast(latitude: userLocation.latitude, longitude: userLocation.longitude) { result in
            switch result {
            case .success(let forecast):
                DispatchQueue.main.async {
                    self.weeklyForecast = forecast
                }
            case .failure:
                // Handle error if needed
                break
            }
        }
    }
}
*/
