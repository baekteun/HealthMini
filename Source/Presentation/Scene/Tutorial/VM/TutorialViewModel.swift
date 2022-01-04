//
//  TutorialViewModel.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/03.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit

final class TutorialViewModel: baseViewModel{
    var kcal = Observable(2000)
    
    func setKcal(_ kcal: Int){
        self.kcal.value = kcal
    }
    
    func setButtonDidTap(){
        UserDefaults.standard.set(kcal.value, forKey: "kcalGoal")
        self.coordinator.navigate(to: HealthStep.setGoalIsCompleted)
    }
}
