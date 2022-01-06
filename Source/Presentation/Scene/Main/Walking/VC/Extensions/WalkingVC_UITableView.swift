//
//  WalkingVC_UITableView.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

extension WalkingVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.stepDatasource.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WalkCountCell.reusableID, for: indexPath) as? WalkCountCell else { return .init() }
        cell.model = viewModel.stepDatasource.value[indexPath.row]
        return cell
    }
}
