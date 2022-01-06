//
//  RecordVC_UITableView.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

extension RecordVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.recordDatasources.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecordCell.reusableID, for: indexPath) as? RecordCell else { return .init() }
        cell.model = viewModel.recordDatasources.value[indexPath.row]
        return cell
    }
    
    
}
