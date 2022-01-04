//
//  AppDI.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

final class AppDI{
    static let shared = AppDI()
    
    func getDefaultSetStartDayUseCase() -> DefaultSetStartDayUseCase{
        let repo = DefaultStartDayRepository()
        return .init(repository: repo)
    }
    
    func getDefaultGetKcalUseCase() -> DefaultGetKcalUseCase{
        let repo = DefaultKcalRepository()
        return .init(repository: repo)
    }
    
    func getTutorialVC(coordinator: baseCoordinator) -> TutorialVC{
        let repo = DefaultKcalRepository()
        let useCase = DefaultSetKcalUseCase(repository: repo)
        let vm = TutorialViewModel(coordinator: coordinator, setKcalUseCase: useCase)
        return TutorialVC(viewModel: vm)
    }
}
