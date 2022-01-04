//
//  AppCoordinator.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/03.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

final class AppCoordinator: baseCoordinator{
    // MARK: - Properties
    private let window: UIWindow
    
    private let getKcalUseCase: GetKcalUseCase
    private lazy var setStartDayUseCase: SetStartDayUseCase = AppDI.shared.getDefaultSetStartDayUseCase()
    
    // MARK: - Start
    init(windowScene: UIWindowScene, navigationController: UINavigationController){
        window = UIWindow(windowScene: windowScene)
        self.getKcalUseCase = AppDI.shared.getDefaultGetKcalUseCase()
        super.init(navigationController: navigationController)
    }
    override func start() {
        initialVC()
        window.makeKeyAndVisible()
        
    }
    
    override func navigate(to step: HealthStep) {
        switch step{
        case .tutorialIsCompleted, .mainIsRequired:
            coordinateToMain()
        case .tutorialIsRequired:
            coordinateToTutorial()
        default:
            return
        }
    }
}

// MARK: - Method
private extension AppCoordinator{
    func initialVC() {
        removeChildCoordinators()
        if getKcalUseCase.execute() == 0{
            self.navigate(to: .tutorialIsRequired)
        }else{
            self.navigate(to: .mainIsRequired)
        }
        
    }
    func coordinateToTutorial() {
        setStartDayUseCase.execute(date: Date())
        let coordinator = TutorialCoordinator(navigationController: navigationController)
        start(coordinator: coordinator)
        window.rootViewController = coordinator.navigationController
    }
    
    func coordinateToMain() {
        let coordinator = MainCoordinator(navigationController: navigationController)
        start(coordinator: coordinator)
        window.rootViewController = coordinator.navigationController
    }
}


