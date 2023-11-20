//
//  HomeView.swift
//  Weather App
//
//  Created by Bruno Matos Silva on 16/11/23.
//

import UIKit

class HomeView: UIView {
    
    private lazy var backgroundView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        label.text = "Meu Local"
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = label.text?.uppercased()
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 120, weight: .light)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var weatherIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var cardDetailView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .lightGray
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .light)
        label.text = "Clima agora"
        label.textColor = .white
        return label
    }()
    
    private lazy var temperatureMinLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.text = "Min"
        label.textColor = .white
        return label
    }()
    
    private lazy var temperatureMinValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textColor = .white
        return label
    }()
    
    private lazy var detailTempStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [temperatureMinLabel, temperatureMinValueLabel])
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var temperatureMaxLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.text = "Max"
        label.textColor = .white
        return label
    }()
    
    private lazy var temperatureMaxValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textAlignment = .right
        label.textColor = .white
        return label
    }()
    
    private lazy var detailTempMaxStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [temperatureMaxLabel, temperatureMaxValueLabel])
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var tempStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [detailTempStackView, detailTempMaxStackView])
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
        return stackView
    }()
    
    private lazy var windLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.text = "Vento"
        label.textColor = .white
        return label
    }()
    
    private lazy var windValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textColor = .white
        return label
    }()
    
    private lazy var detailWindStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [windLabel, windValueLabel])
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var humidtyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.text = "Umidade"
        label.textColor = .white
        return label
    }()
    
    private lazy var humidityValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textAlignment = .right
        label.textColor = .white
        return label
    }()
    
    private lazy var detailHumidityStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humidtyLabel, humidityValueLabel])
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var tempConditionsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [detailWindStackView, detailHumidityStackView])
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setHierarchy()
        self.setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(with weatherViewModel: WeatherViewModel) {
        cityLabel.text = weatherViewModel.name.uppercased()
        temperatureLabel.text = "\(Int(weatherViewModel.main.temp))º"
        weatherIcon.image = UIImage(named: "\(weatherViewModel.weather[0].icon)")
        temperatureMinValueLabel.text = "\(Int(weatherViewModel.main.tempMin))º"
        temperatureMaxValueLabel.text = "\(Int(weatherViewModel.main.tempMax))º"
        windValueLabel.text = "\(Int(weatherViewModel.wind.speed))Km/h"
        humidityValueLabel.text = "\(weatherViewModel.main.humidity)%"
    }
    
    private func setHierarchy() {
        addSubview(backgroundView)
        addSubview(titleLabel)
        addSubview(cityLabel)
        addSubview(temperatureLabel)
        addSubview(weatherIcon)
        addSubview(cardDetailView)
        
        cardDetailView.addSubview(subtitleLabel)
        cardDetailView.addSubview(tempStackView)
        cardDetailView.addSubview(tempConditionsStackView)
    }

    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            cityLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 5),
            cityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor,constant: 5),
            temperatureLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            weatherIcon.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 20),
            weatherIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherIcon.heightAnchor.constraint(equalToConstant: 240),
            weatherIcon.widthAnchor.constraint(equalToConstant: 240),
            
            cardDetailView.topAnchor.constraint(equalTo: weatherIcon.bottomAnchor, constant: 40),
            cardDetailView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardDetailView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardDetailView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: cardDetailView.topAnchor, constant: 25),
            subtitleLabel.leadingAnchor.constraint(equalTo: cardDetailView.leadingAnchor, constant: 40),
            
            tempStackView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20),
            tempStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tempStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            tempConditionsStackView.topAnchor.constraint(equalTo: tempStackView.bottomAnchor, constant: 10),
            tempConditionsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tempConditionsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
        ])
    }
    
}
