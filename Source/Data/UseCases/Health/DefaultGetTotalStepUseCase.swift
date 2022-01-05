//
//  DefaultGetTotalStepUseCase.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/05.
//  Copyright © 2022 baegteun. All rights reserved.
//

final class DefaultGetTotalStepUseCase: GetTotalStepUseCase{
    let repo: HealthRepository
    init(repo: HealthRepository){
        self.repo = repo
    }
    func execute() async throws -> Int {
        return try await repo.getTotalStep()
    }
}
