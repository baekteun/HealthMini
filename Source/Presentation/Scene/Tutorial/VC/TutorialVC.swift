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
        lb.font = UIFont(font: HealthMiniFontFamily.Roboto.bold, size: 18)
        lb.textColor = .black
        return lb
    }()
    
    private let setButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = HealthMiniAsset.healthMainColor.color
        btn.setTitle("설정완료", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 10
        btn.titleLabel?.font = UIFont(font: HealthMiniFontFamily.Roboto.bold, size: 12)
        return btn
    }()
    
    // MARK: - UI
    override func addView() {
        view.addSubViews(slider, kcalLabel, setButton)
    }
    override func setLayout() {
        NSLayoutConstraint.activate([
            slider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            kcalLabel.centerXAnchor.constraint(equalTo: slider.centerXAnchor),
            kcalLabel.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -20),
            
            setButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            setButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bound.height*0.1588),
            setButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            setButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            setButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    override func configureVC() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "목표를 정해주세요"
        self.navigationItem.accessibilityLabel = "목표를 정해주세요"
    }
    override func viewDidAppear(_ animated: Bool) {
        viewModel.setKcal(2000)
    }
    
    // MARK: - Bind
    override func bindVM() {
        viewModel.kcal.bind { [ weak self] in
            let str = NSMutableAttributedString(string: "\($0)kcal")
            str.setFontForText(textToFind: "kcal", withFont: UIFont(font: HealthMiniFontFamily.Roboto.bold, size: 12) ?? .init())
            self?.kcalLabel.attributedText = str
        }
    }
}
