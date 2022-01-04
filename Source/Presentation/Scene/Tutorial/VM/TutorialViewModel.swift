//
//  TutorialViewModel.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/03.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit
import RealmSwift

final class TutorialViewModel: baseViewModel{
    // MARK: - Init
    init(coordinator: baseCoordinator, setKcalUseCase: SetKcalUseCase){
        self.setKcalUseCase = setKcalUseCase
        super.init(coordinator: coordinator)
    }
    
    // MARK: - Properties
    var kcal = Observable(2000)
    
    private let setKcalUseCase: SetKcalUseCase
    
    // MARK: - Method
    func setKcal(_ kcal: Int){
        self.kcal.value = kcal
    }
    
    func setButtonDidTap(){
        setKcalUseCase.execute(kcal: kcal.value)
        self.coordinator.navigate(to: HealthStep.setGoalIsCompleted)
    }
}
