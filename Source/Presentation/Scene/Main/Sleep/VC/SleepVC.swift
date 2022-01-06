//
//  SleepVC.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

final class SleepVC: baseVC<SleepVM>{
    // MARK: - Properties
    private let todaySleepView: TodaySleepView = {
        let v = TodaySleepView()
        return v
    }()
    
    private let isEnoughSleepLabel = IsEnoughSleepLabel()
    
    // MARK: - UI
    override func addView() {
        view.addSubViews(todaySleepView, isEnoughSleepLabel)
    }
    override func setLayout() {
        NSLayoutConstraint.activate([
            todaySleepView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            todaySleepView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            todaySleepView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: bound.height*0.0015),
            todaySleepView.heightAnchor.constraint(equalToConstant: bound.height*0.2068),
            
            isEnoughSleepLabel.leadingAnchor.constraint(equalTo: todaySleepView.leadingAnchor),
            isEnoughSleepLabel.trailingAnchor.constraint(equalTo: todaySleepView.trailingAnchor),
            isEnoughSleepLabel.topAnchor.constraint(equalTo: todaySleepView.bottomAnchor, constant: 20),
            isEnoughSleepLabel.heightAnchor.constraint(equalToConstant: bound.height*0.1187)
        ])
    }
    override func configureVC() {
        
    }
}
