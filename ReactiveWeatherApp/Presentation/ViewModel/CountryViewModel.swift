//
//  CountryViewModel.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 28.06.2022..
//

import Foundation
import RxSwift
import RxRelay

class CountryViewModel {
    
    let disposeBag = DisposeBag()
    let countryUseCase: CountryUseCaseProvider
    let bookmarkedCitiesUseCase: BookmarkedCitiesUseCase
    
    //output
    let cityList: Observable<[CityListModel]>
    let isLoading: Observable<Bool>
    
    //input
    private let loadingSubject = BehaviorRelay<Bool>(value: true)
    private(set) var cityListSubject = PublishSubject<[CityListModel]>()
    private(set) var localCityList = BehaviorRelay<[CityListModel]>(value: [])
    private(set) var searchResults = BehaviorRelay<[CityListModel]>(value: [])
    private(set) var local = BehaviorRelay<[CityListModel]>(value: [])
    private(set) var loadTrigger: PublishSubject<Void>
    private(set) var selectedCitiesTrigger: PublishSubject<CityListModel>

    init(countryUseCase: CountryUseCaseProvider, bookmarkedCitiesUseCase: BookmarkedCitiesUseCase) {
        self.countryUseCase = countryUseCase
        self.bookmarkedCitiesUseCase = bookmarkedCitiesUseCase
        self.cityList = cityListSubject.asObservable()
        self.isLoading = loadingSubject.asObservable()
        self.loadTrigger = PublishSubject()
        self.selectedCitiesTrigger = PublishSubject()
        load()
        trigger()
    }
    
    func trigger() {
        selectedCitiesTrigger.subscribe(with: self,onNext: { owner, city in
            owner.bookmarkedCitiesUseCase.saveCity(name: city)
            }).disposed(by: disposeBag)
        }
    
    
    func load() {
        loadTrigger.withUnretained(self)
            .observe(on: ConcurrentDispatchQueueScheduler(qos: .default))
            .flatMap { owner, _ -> Observable<[CityListModel]> in
                owner.countryUseCase.getCityList()
            }.debug("aaaa", trimOutput: false)
            .subscribe(onNext: { [weak self] cityList in
                self?.localCityList.accept(cityList)
                self?.searchResults.accept(cityList)
                self?.loadingSubject.accept(false)
            }).disposed(by: disposeBag)
    }
 
    func searchCityName(withName name: String) {
        
        loadingSubject.accept(true)
        loadingSubject.accept(false)
        
        
        if name.isEmpty {
            searchResults.accept(localCityList.value)
        }else {
            filterCity(withCityName: name)
        }
    }
    
    private func filterCity(withCityName cityName: String) {
        let cityList = localCityList.value
        let cities = cityList.filter { city in
            return city.name?.contains(cityName) ?? false
            
        }
        print(cities)
        self.searchResults.accept(cities)
    }
}

