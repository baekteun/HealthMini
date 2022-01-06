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
        tb.register(RecordCell.self, forCellReuseIdentifier: RecordCell.reusableID)
        tb.rowHeight = 95
        tb.separatorStyle = .none
        
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
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    override func configureVC() {
        
    }
    private func setDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func bindVM() {
        viewModel.recordDatasources.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}
