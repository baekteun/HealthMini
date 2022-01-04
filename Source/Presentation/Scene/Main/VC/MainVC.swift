//
//  MainVC.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit
import Charts

final class MainVC: baseVC<baseViewModel>{
    // MARK: - Properties
    private let chart: BarChartView = {
       let chart = BarChartView()
        chart.backgroundColor = UIColor(red: 0.2556, green: 0.2556, blue: 0.2556, alpha: 1)
        chart.layer.cornerRadius = 22
        chart.clipsToBounds = true
        chart.noDataText = "아직 데이터가 없습니다!"
        chart.noDataTextColor = .white
        chart.noDataFont = UIFont(font: HealthMiniFontFamily.Roboto.bold, size: 24) ?? .init()
        return chart
    }()
    
    // MARK: - UI
    override func addView() {
        view.addSubViews(chart)
    }
    override func setLayout() {
        NSLayoutConstraint.activate([
            chart.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chart.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            chart.widthAnchor.constraint(equalToConstant: bound.width*0.8933),
            chart.heightAnchor.constraint(equalToConstant: bound.width*0.8933 - 20)
        ])
    }
    override func configureVC() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Today Exercise"
        self.navigationItem.accessibilityLabel = "Today Exercise"
    }
}
