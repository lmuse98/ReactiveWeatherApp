//
//  WeatherService.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 07.06.2022..
//

import Foundation
import UIKit
import RxSwift

protocol WeatherServiceProvider {
    func getWeather(city: String) -> Single<ResultWeather>
}

class WeatherService: WeatherServiceProvider {
    
    let networkManager: NetworkManagerProvider
    let api = Api()
    
    init(networkManager: NetworkManagerProvider) {
        self.networkManager = networkManager
    }
    
    
    func getWeather(city: String) -> Single<ResultWeather> {
        
        guard let url = api.singleCityWeather(city: city) else { return .just(.failure(NetworkError.badURL)) }
        
        let payload: [String: String] = [ "q": city,
                                          "units": Api.uniMetric,
                                          "APPID": Api.apiKey]
        let resource = Resource(url: url, parameter: payload)
        
        return networkManager.load(resource: resource, type: Weather.self).flatMap { weather -> Single<ResultWeather> in
            debugPrint(weather)
            return .just(.success(weather))
        }
    }
    
    /*
     func getWeather(byCityIds Ids: String) -> Observable<CityWeatherModel> {
     guard let url = api.groupWeatherId else { return Observable.error(NetworkError.badURL) }
     
     let payload: [String: String] = [ "q": Ids,
     "units": Api.uniMetric ,
     "APPID": Api.apiKey]
     
     let resource = Resource(url: url, parameter: payload)
     return networkManager.load(resource: resource, type: CityWeatherModel.self).flatMap {
     city -> Observable<CityWeatherModel> in
     debugPrint(city)
     return Observable.just(city)
     }
         }
         */
}

