//
//  WeatherView.swift
//  WeatherAppiOS
//
//  Created by Edvin Mujanovic on 2024-01-24.
//

import SwiftUI

struct WeatherView: View {
    @State private var model = Weathermodels()
    
    
    var body: some View {
        VStack{
            if model.isLoading{
                ProgressView()
            } else {
                
            }
                .task{
                    try? await model.loadWeather()
                }
        }
    }
    
}

#Preview {
    WeatherView()
}
