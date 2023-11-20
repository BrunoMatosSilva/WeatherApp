//
//  LoadingViewController.swift
//  Weather App
//
//  Created by Bruno Matos Silva on 18/11/23.
//

import Foundation
import UIKit

final class Loading {
    
    private var viewController: UIViewController
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.color = .gray
        activityIndicatorView.style = .large
        return activityIndicatorView
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    private func setHierarchy() {
        containerView.addSubview(activityIndicatorView)
        containerView.addSubview(messageLabel)
        viewController.view.addSubview(containerView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: viewController.view.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            messageLabel.topAnchor.constraint(equalTo: activityIndicatorView.bottomAnchor, constant: 20),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
        ])
    }
    
    public func show(message: String? = nil) {
        setHierarchy()
        setConstraints()
        
        messageLabel.text = message
        messageLabel.isHidden = message == nil
        activityIndicatorView.startAnimating()
    }
    
    public func hide() {
        activityIndicatorView.stopAnimating()
        containerView.removeFromSuperview()
    }

}
