//
//  HealthRepository.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/05.
//  Copyright © 2022 baegteun. All rights reserved.
//

protocol HealthRepository{
    func getTotalStep() async throws -> Int
    func getAllStepWithDay() async throws -> [StepWithDay]
}
