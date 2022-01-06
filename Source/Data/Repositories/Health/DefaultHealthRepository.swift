//
//  DefaultHealthRepository.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/05.
//  Copyright © 2022 baegteun. All rights reserved.
//

import HealthKit
import RealmSwift

final class DefaultHealthRepository: HealthRepository{
    let store = HKHealthStore()
    
    func getTotalStep(completion: @escaping ((Int?, Error?)) -> Void) {
        reqRead()
        self.getTotalStepMethod(completion: completion)
    }
    
    func getAllStepWithDay(completion: @escaping (([StepWithDay]?, Error?)) -> Void) {
        reqRead()
        self.getAllStepWithDayMethod(completion: completion)
    }
    
    func getSleepTime(completion: @escaping ((Int?, Error?)) -> Void) {
        reqRead()
        self.getSleepTimeMethod(completion: completion)
    }
    
    func getRecords(completion: @escaping (([Record]?, Error?)) -> Void) {
        reqRead()
        self.getRecordsMethod(completion: completion)
    }
    
    func getTodayExercies(completion: @escaping (([KcalWithDay]?, Error?)) -> Void) {
        reqRead()
        self.getTodayExerciesMethod(completion: completion)
    }
    
    func fetchRecord() {
        reqRead()
        self.fetchRecordMethod()
    }
}

private extension DefaultHealthRepository{
    func reqRead(){
        store.requestAuthorization(toShare: nil, read: [
            .categoryType(forIdentifier: .sleepAnalysis) ?? .workoutType(),
            .quantityType(forIdentifier: .stepCount) ?? .workoutType(),
            .quantityType(forIdentifier: .activeEnergyBurned) ?? .workoutType()
        ]) { suc, err in
            if let err = err{
                print(err.localizedDescription)
                return
            }
            if suc{
                print("Authorized")
            }else{
                print("Not Authorized")
            }
        }
    }
}
