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
    let getWeatherHandler = GetWeatherHandler()
    
    init() {
        //getWeatherHandler.getWeather(city:"Split").subscribe(onNext: { value in
         //   print(value)
        //}).disposed(by: disposeBag)
        
        getWeatherHandler.getWeather(city: "Split").subscribe({ value in
            print(value)
        }).disposed(by: disposeBag)
        
        /*
        getWeatherHandler.getWeather(byCityIds: "658226").subscribe(onNext: { value in
            print(value)
        }) */
    }
    
}

