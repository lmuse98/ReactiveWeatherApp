//
//  URL.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 15.06.2022..
//

import Foundation

extension URL {
    
    static func iconURL(_ icon: String) -> URL? {
        return URL(string: Api.iconURL + "img/wn/\(icon)@2x.png")
    }
}

