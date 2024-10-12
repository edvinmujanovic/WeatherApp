//
//  ContentView.swift
//  WeatherAppiOS
//
//  Created by Edvin Mujanovic on 2024-01-22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            WeatherView()
                .navigationTitle("WeatherApp 🌦")
        }
    }
}

#Preview {
    ContentView()
}
    
    
    
    
    
    
