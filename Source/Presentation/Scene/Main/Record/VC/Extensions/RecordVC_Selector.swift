//
//  RecordVC_Selector.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

extension RecordVC{
    @objc func editButonDidTap(_ sender: UIBarButtonItem) {
        viewModel.isEditingMode.value = !viewModel.isEditingMode.value
    }
}
