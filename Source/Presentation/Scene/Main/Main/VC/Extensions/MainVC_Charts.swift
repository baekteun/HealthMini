//
//  MainVC_Charts.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/07.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Charts

extension MainVC{
    func setCharts(data: [KcalWithDay]) -> ChartData{
        var dataEntry: [BarChartDataEntry] = []
        for i in data.indices{
            let entry = BarChartDataEntry(x: Double(i), y: Double(data[i].burnedKcal))
            dataEntry.append(entry)
        }
        let chartDataSet = BarChartDataSet(entries: dataEntry, label: "Kcal")
        chartDataSet.colors = [.lightGray]
        chartDataSet.highlightEnabled = false
        chartDataSet.valueTextColor = .white
        chartDataSet.valueFont = UIFont(font: HealthMiniFontFamily.Roboto.regular, size: 12) ?? .init()
        
        let chartData = BarChartData(dataSet: chartDataSet )
        return chartData
    }
}
