//
//  WeatherUseCase.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 13.06.2022..
//

import Foundation

final class WeatherUseCase  {
    
    private let weatherRepository: WeatherRepositoryProvider
    
    init(weatherRepository: WeatherRepositoryProvider) {
        self.weatherRepository = weatherRepository
    }
    
    
}
