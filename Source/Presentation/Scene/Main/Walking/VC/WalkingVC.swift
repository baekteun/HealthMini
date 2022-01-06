//
//  WalkingVC.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation
import UIKit

final class WalkingVC: baseVC<WalkingVM>{
    // MARK: - Properties
    private let stepCountView: StepCountView = {
        let v = StepCountView()
        return v
    }()
    
    private let stepTableView: UITableView = {
        let tb = UITableView()
        tb.register(WalkCountCell.self, forCellReuseIdentifier: WalkCountCell.reusableID)
        tb.rowHeight = 95
        tb.separatorStyle = .none
        return tb
    }()
    
    // MARK: - Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidLoad()
    }
    
    
    
    // MARK: - UI
    override func setUp() {
        setDelegate()
    }
    override func addView() {
        view.addSubViews(stepCountView, stepTableView)
    }
    override func setLayout() {
        NSLayoutConstraint.activate([
            stepCountView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stepCountView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stepCountView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stepCountView.heightAnchor.constraint(equalToConstant: bound.height*0.2068),
            
            stepTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stepTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stepTableView.topAnchor.constraint(equalTo: stepCountView.bottomAnchor, constant: 40),
            stepTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    override func configureVC() {
        self.navigationController?.navigationBar.tintColor = .black
    }
    private func setDelegate(){
        stepTableView.delegate = self
        stepTableView.dataSource = self
    }
    
    override func bindVM() {
        viewModel.stepCount.bind { total, ave in
            self.stepCountView.bind(total: total, average: ave)
        }
        
        viewModel.stepDatasource.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.stepTableView.reloadData()
            }
        }
    }
}
