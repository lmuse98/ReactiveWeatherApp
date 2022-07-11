//
//  UserDefaultsManager.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 06.07.2022..
//

import Foundation

protocol DatabaseSourceProvider {
    func saveObjects<T: Codable>(object: T)
    func getObject<T: Codable>(key: String) -> T?
}

final class UserDefaultsManager: DatabaseSourceProvider {
    
    private let userDefaults = UserDefaults.standard

    init() {
        
    }
    
    func saveObjects<T: Codable>(object: T) {
        if let data = try? JSONEncoder().encode(object) {
            userDefaults.set(data, forKey: "key")
            print("saved to userDefaults",data)
        }
    }
    
    func getObject<T: Codable>(key: String) -> T? {
        if let data = userDefaults.data(forKey: key) {
            let object = try? JSONDecoder().decode(T.self, from: data)
            dump(object)
            return object
        }
        return nil
    }
}
