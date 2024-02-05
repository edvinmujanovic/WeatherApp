//
//  WeatherModels.swift
//  WeatherAppiOS
//
//  Created by Edvin Mujanovic on 2024-01-24.
//

import Foundation
import Observation

@Observable
class Weathermodels {
    
    
    private let baseUrl = "https://api.open-meteo.com/v1/forecast"
    var locationManager: LocationManager
    
    
    private var weatherUrl =  "?latitude=%f&longitude=%f&current=temperature_2m,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=Europe%2FBerlin" //mabye not needed to type an url here
    
    var isLoading = false
    var weeklyWeather: [WeeklyModel] = [] //as garrit did
    var currentWeather: CurrentModel?
    var dataStoring: DataStoring?
    var currentTemperature: Double = 0.0 {
        didSet {
            UserDefaults(suiteName: DataStoring.SharedStorage)?.set(currentTemperature, forKey: DataStoring.tempKey)
        }
    }
    
    
    
    
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
    }
    
    func loadWeather() async throws {
        guard let currentLocation = locationManager.currentLocation else {
            print("Location Problem")
            return
        }
        
        // Update the weatherUrl with the actual latitude and longitude
        weatherUrl = "?latitude=\(currentLocation.latitude)&longitude=\(currentLocation.longitude)&current=temperature_2m,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=Europe%2FBerlin"
        
        guard let url = URL(string: baseUrl + weatherUrl) else {
            return
        }
        isLoading = true
        
        let (data, _) = try await URLSession.shared.data(from: url)
        do{
            let weather = try JSONDecoder().decode(WeatherData.self, from: data)
            weeklyWeather = [WeeklyModel(daily: weather.daily, baseUrl: baseUrl)] //as garrit did
            currentWeather = CurrentModel(current: weather.current, baseUrl: baseUrl)
            print(weather)
            currentTemperature = currentWeather?.temp ?? 0.0
            UserDefaults(suiteName: DataStoring.SharedStorage)?.set(currentTemperature, forKey: DataStoring.tempKey)
            
            
        } catch{
            print(error)
        }
        isLoading = false
    }
}
