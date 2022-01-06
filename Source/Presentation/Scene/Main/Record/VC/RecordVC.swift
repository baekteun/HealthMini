//
//  RecordVC.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

final class RecordVC: baseVC<RecordVM>{
    // MARK: - Properties
    private let tableView: UITableView = {
        let tb = UITableView()
        return tb
    }()
    
    // MARK: - Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidAppear()
    }
    
    // MARK: - UI
    override func setUp() {
        setDelegate()
    }
    override func addView() {
        view.addSubViews(tableView)
    }
    override func setLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    override func configureVC() {
        
    }
    private func setDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
    }
}
