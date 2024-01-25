//
//  APIManager.swift
//  WeatherAppiOS
//
//  Created by Edvin Mujanovic on 2024-01-23.
//

import Foundation



/*



class APIManager {
    private let baseUrl = "https://api.open-meteo.com/v1/forecast"

    func fetchCurrentWeather(latitude: Double, longitude: Double, completion: @escaping (Result<WeatherModel, Error>) -> Void) {
        let urlString = "\(baseUrl)?latitude=\(latitude)&longitude=\(longitude)&current=temperature_2m,weather_code&timezone=Europe%2FBerlin"

        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let weather = try decoder.decode(WeatherModel.self, from: data)
                completion(.success(weather))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    func fetchWeeklyForecast(latitude: Double, longitude: Double, completion: @escaping (Result<[WeatherModel], Error>) -> Void) {
        let urlString = "\(baseUrl)?latitude=\(latitude)&longitude=\(longitude)&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=Europe%2FBerlin"

        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let weeklyForecast = try decoder.decode([WeatherModel].self, from: data)
                print(weeklyForecast)
                completion(.success(weeklyForecast))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
}*/
