//
//  WeatherViewModel.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 18.05.2022..
//

import Foundation
import RxSwift

class WeatherViewModel {
    
    let disposeBag = DisposeBag()
    let weatherService: WeatherServiceProvider

    init(weatherService: WeatherServiceProvider) {
        self.weatherService = weatherService
        
        weatherService.getWeather(city: "London").subscribe({ value in
            print(value)
        }).disposed(by: disposeBag)
    
    }
    
}

