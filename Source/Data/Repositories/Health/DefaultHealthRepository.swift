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
    private let store = HKHealthStore()
    
    func getTotalStep(completion: @escaping ((Int?, Error?)) -> Void) {
        let realm = try! Realm()
        let startDay = realm.objects(StartDay.self).first?.startDay ?? .init()
        let endDay = Date()
        DispatchQueue.main.async {
            guard let step = HKObjectType.quantityType(forIdentifier: .stepCount) else { return }
            var dateComponents = DateComponents()
            dateComponents.day = 1
            
            var anchorComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date())
            anchorComponents.hour = 0
            let anchorDate = Calendar.current.date(from: anchorComponents) ?? .init()
            let query = HKStatisticsCollectionQuery(
                quantityType: step,
                quantitySamplePredicate: nil,
                options: .cumulativeSum,
                anchorDate: anchorDate,
                intervalComponents: dateComponents)
            
            query.initialResultsHandler = { query, res, err in
                if let err = err{
                    completion((nil, err))
                    return
                }
                
                if let res = res{
                    var total = 0
                    res.enumerateStatistics(from: startDay, to: endDay) { statics, stop in
                        
                        if let qu = statics.sumQuantity(){
                            total += Int(qu.doubleValue(for: .count()))
                        }
                    }
                    print(total)
                    completion((total, nil))
                }
            }
            self.store.execute(query)
        }
        
    }
    
    func getAllStepWithDay(completion: @escaping (([StepWithDay]?, Error?)) -> Void) {
        let realm = try! Realm()
        let startDay = realm.objects(StartDay.self).first?.startDay ?? .init()
        let endDay = Date()
        DispatchQueue.main.async {
            guard let step = HKObjectType.quantityType(forIdentifier: .stepCount) else { return }
            var dateComponents = DateComponents()
            dateComponents.day = 1
            
            var anchorComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date())
            anchorComponents.hour = 0
            let anchorDate = Calendar.current.date(from: anchorComponents) ?? .init()
            let query = HKStatisticsCollectionQuery(
                quantityType: step,
                quantitySamplePredicate: nil,
                options: .cumulativeSum,
                anchorDate: anchorDate,
                intervalComponents: dateComponents)
            
            query.initialResultsHandler = { query, res, err in
                if let err = err{
                    completion((nil, err))
                    return
                }
                
                if let res = res{
                    var steps: [StepWithDay] = []
                    res.enumerateStatistics(from: startDay, to: endDay) { statics, stop in
                        
                        if let qu = statics.sumQuantity(){
                            steps.append(.init(date: statics.endDate, stepCount: Int(qu.doubleValue(for: .count()))))
                        }
                    }
                    
                    completion((steps, nil))
                }
            }
            self.store.execute(query)
        }
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
