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
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 14
         
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width*0.35, height: UIScreen.main.bounds.width*0.35), collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.register(HealthKindCell.self, forCellWithReuseIdentifier: HealthKindCell.reusableID)
        collection.contentInset = .init(top: 0, left: 5, bottom: 0, right: 5)
        return collection
    }()
    
    private let goalCountLabel: UILabel = {
       let lb = UILabel()
        lb.font = UIFont(font: HealthMiniFontFamily.Roboto.bold, size: 12)
        lb.layer.borderWidth = 1
        lb.layer.borderColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1).cgColor
        lb.textAlignment = .center
        lb.numberOfLines = 0
        lb.layer.cornerRadius = 20
        return lb
    }()
    
    // MARK: - Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.setDatasource(data: [.WALKING, .RECORD, .SLEEP])
    }
    
    // MARK: - UI
    override func setUp() {
        setDelegate()
    }
    override func addView() {
        view.addSubViews(chart, collectionView, goalCountLabel)
    }
    override func setLayout() {
        NSLayoutConstraint.activate([
            chart.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chart.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            chart.widthAnchor.constraint(equalToConstant: bound.width*0.8933),
            chart.heightAnchor.constraint(equalToConstant: bound.width*0.8933 - 10),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.topAnchor.constraint(equalTo: chart.bottomAnchor, constant: 35),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bound.width*0.3743),
            
            goalCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            goalCountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            goalCountLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: bound.height*0.0467),
            goalCountLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bound.height*0.0517)
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
