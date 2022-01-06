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
            reqAuthoHKit()
            self.getTotalStepMethod(completion: completion)
        }else{
            self.getTotalStepMethod(completion: completion)
        }
        
    }
    
    func getAllStepWithDay(completion: @escaping (([StepWithDay]?, Error?)) -> Void) {
        if !HKHealthStore.isHealthDataAvailable(){
            reqAuthoHKit()
            self.getAllStepWithDayMethod(completion: completion)
        }else{
            self.getAllStepWithDayMethod(completion: completion)
        }
        
    }
    
    func getSleepTime(completion: @escaping ((Int?, Error?)) -> Void) {
        if !HKHealthStore.isHealthDataAvailable(){
            reqAuthoHKit()
            self.getSleepTimeMethod(completion: completion)
        }else{
            self.getSleepTimeMethod(completion: completion)
        }
        
    }
}

private extension DefaultHealthRepository{
    func reqAuthoHKit(){
        store.requestAuthorization(toShare: nil, read: [
            .workoutType(),
            .categoryType(forIdentifier: .sleepAnalysis) ?? .workoutType(),
            .quantityType(forIdentifier: .stepCount)!
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
