//
//  MainCoordinator.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

final class MainCoordinator: baseCoordinator{
    // MARK: - Start
    override func start() {
        let vm = MainVM(coordinator: self)
        let vc = MainVC(viewModel: vm)
        self.navigationController.setViewControllers([vc], animated: true)
    }
    
    // MARK: - Navigate
    override func navigate(to step: HealthStep) {
        switch step{
        case .walkingIsRequired:
            navigateToWalking()
        case .recordIsRequired:
            navigateToRecord()
        case .sleepIsRequired:
            navigateToSleep()
        default:
            return
        }
    }
}

private extension MainCoordinator{
    func navigateToWalking() {
        let vc = AppDI.shared.getWalkingVC(coordinator: self)
        self.navigationController.pushViewController(vc, animated: true)
    }
    func navigateToSleep() {
        let vc = AppDI.shared.getSleepVC(coordinator: self)
        self.navigationController.pushViewController(vc, animated: true)
    }
    func navigateToRecord() {
        let vc = AppDI.shared.getRecordVC(coordinator: self)
        self.navigationController.pushViewController(vc, animated: true)
    }
}
