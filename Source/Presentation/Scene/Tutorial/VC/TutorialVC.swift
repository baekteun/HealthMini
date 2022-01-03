//
//  TutorialVC.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/03.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation
import UIKit

final class TutorialVC: baseVC<TutorialViewModel>{
    // MARK: - Properties
    private let slider: TutorialSliderView = {
       let slider = TutorialSliderView()
        slider.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .valueChanged)
        return slider
    }()
    
    private let kcalLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(font: HealthMiniFontFamily.Roboto.regular, size: 18)
        lb.textColor = .black
        return lb
    }()
    
    // MARK: - UI
    override func addView() {
        view.addSubViews(slider, kcalLabel)
    }
    override func setLayout() {
        NSLayoutConstraint.activate([
            slider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            kcalLabel.centerXAnchor.constraint(equalTo: slider.centerXAnchor),
            kcalLabel.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -20),
        ])
    }
    override func configureVC() {
        
    }
    override func viewDidAppear(_ animated: Bool) {
        viewModel.setKcal(2000)
    }
    
    // MARK: - Bind
    override func bindVM() {
        viewModel.kcal.bind { [ weak self] in
            let str = NSMutableAttributedString(string: "\($0)kcal")
            str.setFontForText(textToFind: "kcal", withFont: UIFont(font: HealthMiniFontFamily.Roboto.regular, size: 12) ?? .init())
            self?.kcalLabel.attributedText = str
        }
    }
}
