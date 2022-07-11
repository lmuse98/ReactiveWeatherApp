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
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        return label
    }()

    private lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
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
        contentView.addSubview(cityLabel)
        contentView.addSubview(countryLabel)
    }
    
    private func setupConstraints() {
        cityLabel.snp.makeConstraints { make in
            make.leading.equalTo(14)
            make.top.equalTo(11)
        }
        countryLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(11)
            make.leading.equalTo(14)
        }
    }
    
    func configure(_ data: CityListModel) {
        cityLabel.text = data.name?.capitalized
        countryLabel.text = data.country?.capitalized
    }
}
