//
//  WeatherRepositoryProvider.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 14.06.2022..
//

import Foundation
import RxSwift

protocol WeatherRepositoryProvider {
    func getWeather(city: String) -> Single<ResultWeather>
}
