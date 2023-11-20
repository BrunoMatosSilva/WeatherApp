//
//  LauchScreen.swift
//  Weather App
//
//  Created by Bruno Matos Silva on 19/11/23.
//

import Foundation
import UIKit

class LauchScreen: UIViewController {
    
    private lazy var imgLogo: UIImageView = {
            let img = UIImageView()
            img.translatesAutoresizingMaskIntoConstraints = false
            img.image = UIImage(named: "04d")
            img.contentMode = .scaleAspectFill
            return img
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            
            setHierarchy()
            setConstraints()
        }
        
        private func setHierarchy() {
            view.addSubview(imgLogo)
        }
        
        private func setConstraints() {
            NSLayoutConstraint.activate([
                imgLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imgLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                imgLogo.widthAnchor.constraint(equalToConstant: 120),
                imgLogo.heightAnchor.constraint(equalToConstant: 120),
                imgLogo.heightAnchor.constraint(equalTo: imgLogo.heightAnchor)
            ])
        }
    }
