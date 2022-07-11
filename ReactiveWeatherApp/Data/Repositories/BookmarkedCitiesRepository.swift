//
//  BookmarkedCitiesRepository.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 06.07.2022..
//

import Foundation

protocol BookmarkedCitiesRepositoryProvider {
    func saveCity(city: CityListModel)
    func getCity<T:Codable>(key: String, type: T.Type) -> T?
}

final class BookmarkedCitiesRepository  {
    
    private let userDefaultsManager: DatabaseSourceProvider
    
    init(userDefaultsManager: DatabaseSourceProvider) {
        self.userDefaultsManager = userDefaultsManager
    }
    
    func saveCity(city: CityListModel) {
        userDefaultsManager.saveObjects(object: city)
    }
    
    func getCity<T:Codable>(key: String, type: T.Type) -> T? {
        userDefaultsManager.getObject(key: key)
    }
}
