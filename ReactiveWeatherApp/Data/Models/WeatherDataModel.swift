//
//  WeatherDataModel.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 23.05.2022..
//

import Foundation

struct WeatherDataModel: Equatable {
    let cityName: String
    let temperature: String
    let iconURL: URL
    let mainName: String
    let description: String
    
    init?(_ data: Weather, unit: SettingsUnit) {
        guard let name = data.name,
              let temp = data.main?.temp,
              let weatherData = data.weather?.first,
              let image = data.weather?.first?.icon,
              let imageUrl = URL.iconURL(image) else { return nil }
        
        self.cityName = name
        self.temperature = "\(temp) \(unit.unitSymbol)"
        self.iconURL = imageUrl
        self.mainName = weatherData.main
        self.description = weatherData.description
    }
}


