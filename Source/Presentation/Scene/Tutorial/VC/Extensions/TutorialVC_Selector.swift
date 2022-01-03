//
//  TutorialVC_Selector.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/03.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

extension TutorialVC{
    @objc func sliderValueDidChange(_ sender: UISlider) {
        viewModel.setKcal(Int(sender.value))
    }
}
