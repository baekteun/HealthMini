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
    
    
    
    // MARK: - UI
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        minimumValue = 0
        maximumValue = 4000
        value = 2000
        minimumTrackTintColor = .black
        maximumTrackTintColor = .black
        setThumbImage(sliderThumbView.asImage(), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Method
    
}
