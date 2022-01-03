//
//  TutorialCoordinator.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/03.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

final class TutorialCoordinator: baseCoordinator{
    // MARK: - Start
    override func start() {
        let vc = TutorialVC(viewModel: .init())
        self.navigationController.setViewControllers([vc], animated: true)
    }
    
}
