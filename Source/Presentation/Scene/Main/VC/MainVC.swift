//
//  MainVC.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit
import Charts

final class MainVC: baseVC<MainVM>{
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
    
    private let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
         
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width*0.35, height: UIScreen.main.bounds.width*0.35), collectionViewLayout: layout)
        collection.contentInset = .init(top: 0, left: 5, bottom: 0, right: 5)
        return collection
    }()
    
    // MARK: - Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.setDatasource(data: [.WALKING, .RECORD, .SLEEP])
    }
    
    // MARK: - UI
    override func addView() {
        view.addSubViews(chart, collectionView)
    }
    override func setLayout() {
        NSLayoutConstraint.activate([
            chart.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chart.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            chart.widthAnchor.constraint(equalToConstant: bound.width*0.8933),
            chart.heightAnchor.constraint(equalToConstant: bound.width*0.8933 - 20),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: chart.bottomAnchor, constant: 35)
        ])
    }
    override func configureVC() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Today Exercise"
        self.navigationItem.accessibilityLabel = "Today Exercise"
    }
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - bind
    override func bindVM() {
        viewModel.dataSource.bind { [weak self] _ in
            self?.collectionView.reloadData()
        }
    }
}
