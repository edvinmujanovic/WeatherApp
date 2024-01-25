//
//  WeatherData.swift
//  WeatherAppiOS
//
//  Created by Edvin Mujanovic on 2024-01-24.
//

import Foundation

struct WeatherData: Decodable {
    let latitude: Double
    let longitude: Double
    let generationtime_ms: Double
    let utc_offset_seconds: Int
    let timezone: String
    let timezone_abbreviation: String
    let elevation: Double
    let current_units: Units
    let current: Current
    let daily_units: Daily_Units
    let daily: Daily

    struct Units: Decodable {
        let time: String
        let interval: String
        let temperature_2m: String
        let weather_code: String
    }
    
    struct Daily_Units: Decodable {
        let time: String
        let weather_code: String
        let temperature_2m_max: String
        let temperature_2m_min: String

        private enum CodingKeys: String, CodingKey {
            case time, weather_code, temperature_2m_max, temperature_2m_min
        }
    }

    struct Current: Decodable {
        let time: String
        let interval: Int
        let temperature_2m: Double
        let weather_code: Int
    }

    struct Daily: Decodable {
        let time: [String]
        let weather_code: [Int]
        let temperature_2m_max: [Double]
        let temperature_2m_min: [Double]
    }
}

