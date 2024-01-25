//
//  WeeklyModel.swift
//  WeatherAppiOS
//
//  Created by Edvin Mujanovic on 2024-01-25.
//

import Foundation
import Observation

//Fixa observable?

@Observable
class WeeklyModel {
    let date : [String]
    let maxTemp : [Double]
    let minTemp : [Double]
    
    init(daily: WeatherData.Daily, baseUrl: String){
        date = daily.time
        maxTemp = daily.temperature_2m_max
        minTemp = daily.temperature_2m_min
    }
    
    
}
