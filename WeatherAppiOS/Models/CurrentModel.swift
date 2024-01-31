//
//  CurrentModel.swift
//  WeatherAppiOS
//
//  Created by Edvin Mujanovic on 2024-01-25.
//

import Foundation
import Observation


@Observable
class CurrentModel {
    let date : String
    let interval: Int
    let temp: Double
    let weatherCode : Int
    
    init(current: WeatherData.Current, baseUrl: String = "") {
        self.date = current.time
        self.interval = current.interval
        self.temp = current.temperature_2m
        self.weatherCode = current.weather_code
    }

    
}
