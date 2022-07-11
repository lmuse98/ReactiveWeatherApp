//
//  CountryRepositoryProvider.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 28.06.2022..
//

import Foundation
import RxSwift

protocol CountryRepositoryProvider {
    func getCityCountryList() -> Observable<[CityListModel]>
}
