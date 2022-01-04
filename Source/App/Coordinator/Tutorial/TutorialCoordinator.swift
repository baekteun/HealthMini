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
        let vc = AppDI.shared.getTutorialVC(coordinator: self)
        self.navigationController.setViewControllers([vc], animated: true)
    }
    
    // MARK: - Navigate
    override func navigate(to step: HealthStep) {
        switch step{
        case .setGoalIsCompleted:
            self.parentCoordinator?.start()
            return
        default:
            return
        }
    }
}
