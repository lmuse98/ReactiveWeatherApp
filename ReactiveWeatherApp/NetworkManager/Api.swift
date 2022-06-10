//
//  URL + Extensions.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 16.05.2022..
//

import Foundation

struct Api {
    
    static let apiKey = "d382b8e94c94fc8fa27abe9bcf571c86"
    static let baseURL = "https://api.openweathermap.org/"
    static let iconURL = "https://api.openweathermap.org/"
    
    static let uniMetric = "metric"
    static let unitImperial = "imperial"
    
    func urlWeatherApi(city: String) -> URL? {
        return URL(string: Api.baseURL + "data/2.5/weather?&APPID=\(Api.apiKey)&q=\(city)")
    }
    
    func urlWeatherCityId(cityIds: String) -> URL? {
        return URL(string: Api.baseURL + "data/2.5/group?id=\(cityIds)&APPID=\(Api.apiKey)&units=metric")
    }
    
    func iconUrl(icon: URL) -> URL? {
        return URL(string: Api.iconURL + "img/wn/\(icon)@2x.png")
    }
    
    
    var singleCityWeather: URL? { return URL(string: Api.baseURL + "data/2.5/weather?appid=\(Api.apiKey)&q=Split&units=metric" ) }
    var groupWeatherId: URL? { return URL(string: Api.baseURL + "data/2.5/group") }
    
    //https://api.openweathermap.org/data/2.5/group
}

