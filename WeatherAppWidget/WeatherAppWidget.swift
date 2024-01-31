//
//  WeatherAppWidget.swift
//  WeatherAppWidget
//
//  Created by Edvin Mujanovic on 2024-01-26.
//


import WidgetKit
import SwiftUI

struct WeatherProvider: TimelineProvider {
    @State private var locationManager = LocationManager()
    @State private var model = Weathermodels(locationManager: LocationManager())

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), temperature: 20.0)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), temperature: 20.0)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        Task {
            var localEntries: [SimpleEntry] = [] // Use a local variable

            do {
                try await model.loadWeather()
                if let currentWeather = model.currentWeather {
                    let entry = SimpleEntry(date: Date(), temperature: currentWeather.temp)
                    localEntries.append(entry)
                }
            } catch {
                print("Error fetching weather data: \(error)")
                let entry = SimpleEntry(date: Date(), temperature: 20.0)
                localEntries.append(entry)
            }

            let timeline = Timeline(entries: localEntries, policy: .atEnd)
            completion(timeline)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let temperature: Double
}

struct WeatherAppWidgetEntryView: View {
    var entry: WeatherProvider.Entry

    var body: some View {
        VStack {
            Text("Current Temperature:")
            Text("\(entry.temperature)°C")
                .font(.title)
                .fontWeight(.bold)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue).shadow(radius: 5))
    }
}

struct WeatherAppWidget: Widget {
    let kind: String = "WeatherAppWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WeatherProvider()) { entry in
            WeatherAppWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Weather Widget")
        .description("Display the current temperature.")
    }
}

#Preview(as: .systemSmall) {
    WeatherAppWidget()
} timeline: {
    SimpleEntry(date: .now, temperature: 20.0)
    SimpleEntry(date: .now, temperature: 25.0)
}
