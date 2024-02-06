//
//  WeatherAppWidget.swift
//  WeatherAppWidget
//
//  Created by Edvin Mujanovic on 2024-01-26.
//


import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), temperature: 10.5)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), temperature: 10.5)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        let storedCurrentTemperature = UserDefaults(suiteName: DataStoring.SharedStorage)?.double(forKey: DataStoring.tempKey) ?? 0.0
        let entry = SimpleEntry(date: Date(), temperature: storedCurrentTemperature)
        entries.append(entry)
        
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let temperature: Double
}

struct WeatherAppWidgetEntryView: View {
    var entry: Provider.Entry
    @State private var widgetAppeared = false //Kolla om widgeten har kommit upp
    
    var body: some View {
        WeatherViewCompact()
            .padding()
            .background(
                Color(.systemBackground)
            )
            .onAppear {
                // Reload the timeline when the widget appears for the first time
                if !widgetAppeared {
                    WidgetCenter.shared.reloadAllTimelines()
                    widgetAppeared = true
                }
            }
    }
}

struct WeatherAppWidget: Widget {
    let kind: String = "WeatherAppWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WeatherAppWidgetEntryView(entry: entry)
                .padding()
                .background(
                    Color(.systemBackground)
                )
        }
        .configurationDisplayName("Weather Widget")
        .description("Display the current temperature.")
    }
}

#Preview(as: .systemSmall) {
    WeatherAppWidget()
} timeline: {
    SimpleEntry(date: .now, temperature: 25.0)
}
