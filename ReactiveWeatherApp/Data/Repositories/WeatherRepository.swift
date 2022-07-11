//
//  WeatherRepository.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 27.06.2022..
//

import Foundation
import RxSwift

final class WeatherRepository: WeatherRepositoryProvider {
    
    private let weatherService: WeatherService
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    func getWeather(city: String) -> Single<ResultWeather> {
        weatherService.getWeather(city: city)
    }
    
    
}
