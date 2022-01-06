//
//  RecordVC_UITableView.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit
import RealmSwift

extension RecordVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.recordDatasources.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecordCell.reusableID, for: indexPath) as? RecordCell else { return .init() }
        cell.model = viewModel.recordDatasources.value[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let realm = try! Realm()
            let obj = realm.object(ofType: Record.self, forPrimaryKey: viewModel.recordDatasources.value[indexPath.row].id) ?? .init()
            try! realm.write{
                realm.delete(obj)
            }
            viewModel.recordDatasources.value.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
