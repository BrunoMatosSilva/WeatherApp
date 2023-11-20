//
//  WelcomeView.swift
//  Weather App
//
//  Created by Bruno Matos Silva on 17/11/23.
//

import UIKit

protocol LocationProtocol: AnyObject {
    func tappedLocationButton()
}

class WelcomeView: UIView {
    
    var onLocationTap: (() -> Void)?
    
    private weak var delegate: LocationProtocol?
    
    public func delegate(delegate: LocationProtocol?){
        self.delegate = delegate
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.text = "Bem-vindo ao aplicativo Weather APP"
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Compartilhe sua localização atual para saber a previsão do tempo na sua região"
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 3
        return label
    }()
    
    private lazy var locationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(tappedLocationButton), for: .touchUpInside)
        button.setTitle("Compartilhar localização atual", for: .normal)
        button.setImage(UIImage(systemName: "location"), for: .normal)
        return button
    }()
    
    @objc func tappedLocationButton() {
        self.delegate?.tappedLocationButton()
        self.onLocationTap?()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        
        setHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHierarchy() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(locationButton)
    }

    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 240),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            locationButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 40),
            locationButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            locationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            locationButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
