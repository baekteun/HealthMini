//  HealthRepository.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/05.
//  Copyright © 2022 baegteun. All rights reserved.
//

protocol HealthRepository{
    func getTotalStep(completion: @escaping((Int?, Error?)) -> Void)
    func getAllStepWithDay(completion: @escaping(([StepWithDay]?, Error?)) -> Void)
    func getSleepTime(completion: @escaping((Int?, Error?)) -> Void)
    func getRecords(completion: @escaping(([Record]?, Error?)) -> Void)
    func getTodayExercies(completion: @escaping(([KcalWithDay]? ,Error?)) -> Void)
    func fetchRecord()
}
