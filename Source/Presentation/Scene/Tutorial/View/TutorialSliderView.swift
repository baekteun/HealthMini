//
//  TutorialSliderView.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/03.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

final class TutorialSliderView: UISlider{
    // MARK: - Properties
    private let sliderThumbView: SliderThumbView = {
       let slider = SliderThumbView(frame: CGRect(x: 0, y: 0, width: 72, height: 20))
        return slider
    }()
    
    private let minimumLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(font: HealthMiniFontFamily.Roboto.bold, size: 12)
        lb.text = "0"
        lb.textAlignment = .center
        return lb
    }()
    
    private let maximumLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(font: HealthMiniFontFamily.Roboto.bold, size: 12)
        lb.text = "4000"
        lb.textAlignment = .center
        return lb
    }()
    
    // MARK: - UI
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    func addView(){
        addSubViews(minimumLabel, maximumLabel)
    }
    func setLayout(){
        NSLayoutConstraint.activate([
            minimumLabel.centerXAnchor.constraint(equalTo: self.leadingAnchor),
            minimumLabel.bottomAnchor.constraint(equalTo: self.topAnchor),
            
            maximumLabel.centerXAnchor.constraint(equalTo: self.trailingAnchor),
            maximumLabel.bottomAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    func configureView(){
        minimumValue = 0
        maximumValue = 4000
        value = 2000
        minimumTrackTintColor = .black
        maximumTrackTintColor = .black
        setThumbImage(sliderThumbView.asImage(), for: .normal)
    }
}
