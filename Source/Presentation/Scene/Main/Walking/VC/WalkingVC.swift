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
    
    // MARK: - Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParent {
            viewModel.coordinator.didFinish(coordinator: self.viewModel.coordinator)
        }
    }
    
    // MARK: - UI
    override func addView() {
        view.addSubViews(stepCountView)
    }
    override func setLayout() {
        NSLayoutConstraint.activate([
            stepCountView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stepCountView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stepCountView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stepCountView.heightAnchor.constraint(equalToConstant: bound.height*0.2068)
        ])
    }
    override func configureVC() {
        
    }
    override func bindVM() {
        viewModel.stepCount.bind { total, ave in
            self.stepCountView.bind(total: total, average: ave)
        }
        
        
    }
}
