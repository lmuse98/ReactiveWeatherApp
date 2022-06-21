//
//  CitySearchViewController.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 20.06.2022..
//

import UIKit
import SnapKit

class CitySearchViewController: UIViewController, UISearchBarDelegate {
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.backgroundColor = .gray
        return searchBar
    }()
    
    var array = ["ante","mate","sime"]

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        configureView()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = searchBar
        view.backgroundColor = .white
        navigationItem.title = "Search City"
    }
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.frame = view.frame
        table.delegate = self
        table.dataSource = self
        table.register(CitySearchTableViewCell.self, forCellReuseIdentifier: CitySearchTableViewCell.Constant.cellName)
        return table
    }()
    
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

extension CitySearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return array.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CitySearchTableViewCell.Constant.cellName, for: indexPath) as? CitySearchTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
