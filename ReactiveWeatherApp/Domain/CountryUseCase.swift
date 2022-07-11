//
//  CountryUseCase.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 28.06.2022..
//

import Foundation
import RxSwift

protocol CountryUseCaseProvider {
    func getCityList() -> Observable<[CityListModel]>
}

final class CountryUseCase: CountryUseCaseProvider {
    
    private let countryRepository: CountryRepository
    
    init(countryRepository: CountryRepository) {
        self.countryRepository = countryRepository
    }
    
    func getCityList() -> Observable<[CityListModel]> {
        countryRepository.getCityCountryList()
    }
}
