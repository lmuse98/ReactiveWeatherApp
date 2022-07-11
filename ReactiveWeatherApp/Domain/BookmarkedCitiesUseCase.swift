//
//  BookmarkedCitiesUseCase.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 06.07.2022..
//

import Foundation

protocol BookmarkedCitiesUseCaseProvider {
    func saveCity(name: CityListModel)
    func getCity<T:Codable>(key: String, type: T.Type) -> T?
}

final class BookmarkedCitiesUseCase {
    
    private let bookmarkedCitiesRepository: BookmarkedCitiesRepository
    
    init(bookmarkedCitiesRepository: BookmarkedCitiesRepository) {
        self.bookmarkedCitiesRepository = bookmarkedCitiesRepository
    }
    
    func saveCity(name: CityListModel) {
        bookmarkedCitiesRepository.saveCity(city: name)
    }
    
    func getCity<T:Codable>(key: String, type: T.Type) -> T? {
        bookmarkedCitiesRepository.getCity(key: key, type: type)
    }
}
