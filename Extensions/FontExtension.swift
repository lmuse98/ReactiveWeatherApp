//
//  FontExtension.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 15.06.2022..
//

import Foundation
import UIKit

extension UIFont {
    
    static var navigationBarTitle: UIFont {
        return .systemFont(ofSize: 24)
    }

    static var navigationBarButtonItem: UIFont {
        return .systemFont(ofSize: 20)
    }

    static var heading1: UIFont {
        return .systemFont(ofSize: 25)
    }

    static var heading2: UIFont {
        return .systemFont(ofSize: 25) //BOLD
    }

    static var body1: UIFont { // city list view
        return .systemFont(ofSize: 20)
    }

    static var body2: UIFont { // city search
        return .systemFont(ofSize: 20)
    }

    static var body3: UIFont { // city search
        return .systemFont(ofSize: 18)
    }

    static var detailTitle: UIFont {
        return .systemFont(ofSize: 16)
    }

    static var detailBody: UIFont {
        return .systemFont(ofSize: 24)
    }
}
