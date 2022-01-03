//
//  TutorialVC.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/03.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation
import UIKit

final class TutorialVC: baseVC{
    // MARK: - Properties
    private let slider: UISlider = {
       let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 4000
        slider.value = 2000
        slider.minimumTrackTintColor = .black
        slider.maximumTrackTintColor = .black
        slider.setThumbImage(
            UIView(frame: CGRect(x: 0, y: 0, width: 72, height: 20)).asImage(), for: .normal)
            for: .normal)
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    // MARK: - UI
    override func addView() {
        [slider].forEach{ view.addSubview($0) }
    }
    override func setLayout() {
        NSLayoutConstraint.activate([
            slider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    override func configureVC() {
        
    }
}
