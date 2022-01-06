//
//  DefaultGetSleepTimeUseCase.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

import Foundation

final class DefaultGetSleepTimeUseCase: GetSleepTimeUseCase{
    let repo: HealthRepository
    
    init(repo: HealthRepository){
        self.repo = repo
    }
    
    func execute(completion: @escaping ((Int?, Error?)) -> Void) {
        repo.getSleepTime(completion: completion)
    }
}
