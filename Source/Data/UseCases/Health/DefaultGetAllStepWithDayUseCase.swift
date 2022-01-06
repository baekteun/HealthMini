//
//  DefaultGetAllStepWithDay.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/05.
//  Copyright © 2022 baegteun. All rights reserved.
//

final class DefaultGetAllStepWithDayUseCase: GetAllStepWithDayUseCase{
    private let repo: HealthRepository
    
    init(repository: HealthRepository) {
        self.repo = repository
    }
    func execute(completion: @escaping (([StepWithDay]?, Error?)) -> Void) {
        repo.getAllStepWithDay(completion: completion)
    }
}
