//
//  DataStoring.swift
//  WeatherAppiOS
//
//  Created by Edvin Mujanovic on 2024-02-02.
//

import Foundation


public struct DataStoring{
    static let tempKey : String = "currentTemperature"
    static let SharedStorage: String = "group.weather.sharing"
    var storedCurrentTemperature: Double = 0.0
}


