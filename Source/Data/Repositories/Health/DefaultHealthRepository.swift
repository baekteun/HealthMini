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
        if !HKHealthStore.isHealthDataAvailable(){
            reqRead()
            self.getTotalStepMethod(completion: completion)
        }else{
            self.getTotalStepMethod(completion: completion)
        }
    }
    
    func getAllStepWithDay(completion: @escaping (([StepWithDay]?, Error?)) -> Void) {
        if !HKHealthStore.isHealthDataAvailable(){
            reqRead()
            self.getAllStepWithDayMethod(completion: completion)
        }else{
            self.getAllStepWithDayMethod(completion: completion)
        }
    }
    
    func getSleepTime(completion: @escaping ((Int?, Error?)) -> Void) {
        if !HKHealthStore.isHealthDataAvailable(){
            reqRead()
            self.getSleepTimeMethod(completion: completion)
        }else{
            self.getSleepTimeMethod(completion: completion)
        }
    }
    
    func getBurnedEnergy(completion: @escaping (([KcalWithDay]?, Error?)) -> Void) {
        if !HKHealthStore.isHealthDataAvailable(){
            reqRead()
            self.getBurnedEnergyMethod(completion: completion)
        }else{
            self.getBurnedEnergyMethod(completion: completion)
        }
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
    func reqWrite(){
        store.requestAuthorization(toShare: [
            .quantityType(forIdentifier: .activeEnergyBurned) ?? .workoutType()
        ], read: nil) { suc, err in
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
