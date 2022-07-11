//
//  CitySearchViewController.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 20.06.2022..
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class CitySearchViewController: UIViewController, UISearchBarDelegate {
    
    private let countryViewModel: CountryViewModel
    let disposeBag = DisposeBag()
    
    
    init(countryViewModel: CountryViewModel) {
        self.countryViewModel = countryViewModel
        super.init(nibName: nil, bundle: nil)
        
        bindViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.backgroundColor = .gray
        return searchBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        configureView()
        searchBar.delegate = self
        tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        tableView.tableHeaderView = searchBar
        view.backgroundColor = .white
        navigationItem.title = "Search City"
        
        bindTableView()
    }
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.frame = view.frame
        table.register(CitySearchTableViewCell.self, forCellReuseIdentifier: CitySearchTableViewCell.Constant.cellName)
        return table
    }()

    func bindViewModel() {
        self.rx.viewDidLoad
            .map { _  in Void()}
            .debug()
            .bind(to: countryViewModel.loadTrigger)
            .disposed(by: disposeBag)
    }
    
    private func bindTableView() {
        
        countryViewModel.searchResults.asObservable()
            .bind(to: tableView.rx
                    .items(cellIdentifier: CitySearchTableViewCell.Constant.cellName , cellType: CitySearchTableViewCell.self))
        { index, element, cell in
            
            cell.configure(element)
            
        }.disposed(by: disposeBag)
        
        searchBar.rx.text.orEmpty
            .throttle(.microseconds(300), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .debug("SEARCH QUERY", trimOutput: false)
            .asObservable()
            .subscribe(onNext: { [weak self] name in
                self?.countryViewModel.searchCityName(withName: name)
            }).disposed(by: disposeBag)
        
        //let activeIndicator = UIActivityIndicatorView(style: .large)
        //countryViewModel.isLoading.bind(to: activeIndicator.rx.isAnimating).disposed(by: disposeBag)
        
        tableView.rx.modelSelected(CityListModel.self)
            .bind(to: countryViewModel.selectedCitiesTrigger)
            .disposed(by: disposeBag)
    }
    
    private func configureView() {
        navigationController?.setCustomStyle()
    }
    
    private func setupViews() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        
    }
}

extension CitySearchViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
