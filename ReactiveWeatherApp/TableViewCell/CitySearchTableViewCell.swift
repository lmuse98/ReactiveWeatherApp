//
//  CitySearchTableViewCell.swift
//  ReactiveWeatherApp
//
//  Created by Luka Muše on 21.06.2022..
//

import UIKit
import SnapKit

class CitySearchTableViewCell: UITableViewCell {
    
    struct Constant {
        static let cellName = "CitySearchCell"
    }
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()

    private lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(cityLabel)
        addSubview(countryLabel)
        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(countryLabel)
    }
    
    private func setupConstraints() {
        cityLabel.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.top.equalTo(10)
        }
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(countryLabel.snp.trailing).offset(10)
        }
    }
    
    func configure(_ data: CityListModel) {
        cityLabel.text = data.name?.capitalized
        countryLabel.text = data.country?.capitalized
    }
}
