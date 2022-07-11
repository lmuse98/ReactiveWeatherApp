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
    private let bookmarkedUseCase: BookmarkedCitiesUseCase
    
    
    

    init(weatherService: WeatherServiceProvider, bookmarkedUseCase: BookmarkedCitiesUseCase) {
        self.weatherService = weatherService
        self.bookmarkedUseCase = bookmarkedUseCase
        
        weatherService.getWeather(city: "London").subscribe({ value in
            print(value)
        }).disposed(by: disposeBag)
        
        let city = bookmarkedUseCase.getCity(key: "key", type: CityListModel.self)
        print("čččččččč",city)
    
    }
}

