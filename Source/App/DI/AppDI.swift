//
//  AppDI.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

// MARK: - VC
final class AppDI{
    static let shared = AppDI()
    
    func getTutorialVC(coordinator: baseCoordinator) -> TutorialVC{
        let vm = TutorialVM(coordinator: coordinator)
        return TutorialVC(viewModel: vm)
    }
    
    func getMainVC(coordinator: baseCoordinator) -> MainVC{
        let vm = MainVM(coordinator: coordinator)
        return MainVC(viewModel: vm)
    }
    
    func getWalkingVC(coordinator: baseCoordinator) -> WalkingVC{
        let vm = WalkingVM(coordinator: coordinator)
        return WalkingVC(viewModel: vm)
    }
}

// MARK: - UseCase
extension AppDI{
    func getDefaultSetStartDayUseCase() -> DefaultSetStartDayUseCase{
        return .init(repository: getDefaultStartDayRepository())
    }
    
    func getDefaultGetStartDayUseCase() -> DefaultGetStartDayUseCase{
        return .init(repository: getDefaultStartDayRepository())
    }
    
    func getDefaultGetKcalUseCase() -> DefaultGetKcalUseCase{
        return .init(repository: getDefaultKcalRepository())
    }
    
    func getDefaultSetKcalUseCase() -> DefaultSetKcalUseCase{
        return .init(repository: getDefaultKcalRepository())
    }
}

// MARK: - Repository
extension AppDI{
    func getDefaultStartDayRepository() -> DefaultStartDayRepository{
        return .init()
    }
    
    func getDefaultKcalRepository() -> DefaultKcalRepository{
        return .init()
    }
}
