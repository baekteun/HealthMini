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
    
    // MARK: - UI
    override func addView() {
        view.addSubViews(todaySleepView)
    }
    override func setLayout() {
        NSLayoutConstraint.activate([
            todaySleepView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            todaySleepView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            todaySleepView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: bound.height*0.0015),
            todaySleepView.heightAnchor.constraint(equalToConstant: bound.height*0.2068)
        ])
    }
    override func configureVC() {
        
    }
}
