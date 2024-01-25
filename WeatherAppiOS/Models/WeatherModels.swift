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
    private let weatherUrl = "?latitude=52.52&longitude=13.41&current=temperature_2m,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=Europe%2FBerlin"
    
    var isLoading = false
    var weeklyWeather: [WeeklyModel] = []
    
    func loadWeather() async throws {
        guard let url = URL(string: baseUrl + weatherUrl) else {
            return
        }
        isLoading = true
        
        let (data, _) = try await URLSession.shared.data(from: url)
        do{
            let weather = try JSONDecoder().decode(WeatherData.self, from: data)
            weeklyWeather = [WeeklyModel(daily: weather.daily, baseUrl: baseUrl)]
            print(weather)
        } catch{
            print(error)
        }
        isLoading = false
    }
}
