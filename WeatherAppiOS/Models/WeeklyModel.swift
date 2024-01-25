//
//  WeeklyModel.swift
//  WeatherAppiOS
//
//  Created by Edvin Mujanovic on 2024-01-25.
//

import Foundation
import Observation


@Observable
class WeeklyModel {
    let date : [String]
    let dayOfWeek: [String]
    let maxTemp : [Double]
    let minTemp : [Double]
    
    init(daily: WeatherData.Daily, baseUrl: String){
        date = daily.time
        dayOfWeek = WeeklyModel.getDayOfWeek(from: daily.time)
        maxTemp = daily.temperature_2m_max
        minTemp = daily.temperature_2m_min
    }
    
    static func getDayOfWeek(from dates: [String]) -> [String] { //för att få veckodag vid datumet
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        return dates.compactMap { dateString in
            if let date = formatter.date(from: dateString) {
                let dayOfWeek = Calendar.current.component(.weekday, from: date)
                return DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .none) + " (\(Calendar.current.shortWeekdaySymbols[dayOfWeek - 1]))"
            } else {
                return nil
            }
        }
    }
    
}
