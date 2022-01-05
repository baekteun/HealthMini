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
    private let realm = try! Realm()
    private let store = HKHealthStore()
    
    func getTotalStep() async throws -> Int {
        try await withCheckedThrowingContinuation({ config in
            DispatchQueue.main.async { [self] in
                var res = 0
                if HKHealthStore.isHealthDataAvailable(){
                    let startDay = realm.objects(StartDay.self).first?.startDay.formatTime() ?? .init()
                    let current = Date()
                    guard let step = HKSampleType.quantityType(forIdentifier: .stepCount) else { fatalError() }
                    
                    let predicate = HKQuery.predicateForSamples(withStart: startDay, end: current, options: .strictStartDate)
                    
                    let query = HKSampleQuery(
                        sampleType: step,
                        predicate: predicate,
                        limit: .max,
                        sortDescriptors: nil
                    ) { _, data, err in
                        if let err = err{
                            print(err.localizedDescription)
                            config.resume(throwing: err)
                        }
                        for sample: HKQuantitySample in (data as? [HKQuantitySample]) ?? [] {
                            res += Int(sample.quantity.doubleValue(for: .count()))
                        }
                    }
                    store.execute(query)
                }
                config.resume(returning: res)
            }
        })
    }
    
    func getAllStepWithDay() async throws -> [StepWithDay]{
        try await withCheckedThrowingContinuation({ config in
            DispatchQueue.main.async { [self] in
                var res: [StepWithDay] = []
                if HKHealthStore.isHealthDataAvailable(){
                    reqAuthoHKit()
                    let startDay = realm.objects(StartDay.self).first?.startDay.formatTime() ?? .init()
                    
                    let current = Date()
                    
                    guard let step = HKSampleType.quantityType(forIdentifier: .stepCount) else { fatalError() }
                    
                    for i in 0..<startDay.betweenDay(date: current){
                        let curDay = Calendar.current.date(byAdding: .day, value: i, to: startDay)
                        let endDay = Calendar.current.date(byAdding: .day, value: i + 1, to: startDay)
                        
                        let predicate = HKQuery.predicateForSamples(withStart: curDay, end: endDay, options: .strictStartDate)
                        
                        let query = HKSampleQuery(
                            sampleType: step,
                            predicate: predicate,
                            limit: .max,
                            sortDescriptors: nil
                        ) { _, data, err in
                            if let err = err{
                                print(err.localizedDescription)
                                config.resume(throwing: err)
                                return
                            }
                            
                            var steps: Int = 0
                            for sample: HKQuantitySample in (data as? [HKQuantitySample]) ?? [] {
                                steps += Int(sample.quantity.doubleValue(for: .count()))
                            }
                            
                            let day = data?.first?.endDate.formatTime() ?? .init()
                            
                            res.append(.init(date: day, stepCount: steps))
                        }
                        store.execute(query)
                    }
                }else{
                    
                }
                config.resume(returning: res)
            }
        })
    }
}

private extension DefaultHealthRepository{
    func reqAuthoHKit(){
        
        
        store.requestAuthorization(toShare: nil, read: [
            .workoutType(),
            .activitySummaryType(),
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
