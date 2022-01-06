//
//  DefaultGetTodayExerciseUseCase.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/07.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Realm

final class DefaultGetTodayExerciseUseCase: GetTodayExerciseUseCase{
    let repo: HealthRepository
    
    init(repo: HealthRepository){
        self.repo = repo
    }
    
    func execute(completion: @escaping (([KcalWithDay]?, Error?)) -> Void) {
        repo.getTodayExercies(completion: completion)
    }
}
