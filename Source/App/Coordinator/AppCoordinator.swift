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
    
    // MARK: - Start
    init(windowScene: UIWindowScene, navigationController: UINavigationController){
        window = UIWindow(windowScene: windowScene)
        super.init(navigationController: navigationController)
    }
    override func start() {
        initialVC()
        window.makeKeyAndVisible()
        
    }
}

// MARK: - Method
private extension AppCoordinator{
    func initialVC() {
        removeChildCoordinators()
        if UserDefaults.standard.integer(forKey: "goal") == 0{
            let coordinator = TutorialCoordinator(navigationController: navigationController)
            start(coordinator: coordinator)
            window.rootViewController = coordinator.navigationController
        }else{
            
        }
        
    }
}
