//
//  fetchRecordMethod.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

import HealthKit
import RealmSwift

extension DefaultHealthRepository{
    func fetchRecordMethod(){
        let realm = try! Realm()
        
        let current = Date()
        guard let step = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned) else { return }
        
        var components = DateComponents()
        components.day = 1
        
        var anchorComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        anchorComponents.hour = 0
        anchorComponents.minute = 0
        anchorComponents.second = 0
        var anchorDate = Calendar.current.date(from: anchorComponents) ?? .init()
        
        let q = HKStatisticsCollectionQuery(
            quantityType: step,
            quantitySamplePredicate: nil,
            options: .cumulativeSum,
            anchorDate: anchorDate,
            intervalComponents: components)
        
        q.initialResultsHandler = { query, res, err in
            if let err = err{
                print(err.localizedDescription)
                return
            }
            
            if let res = res{
                var step = 0
                res.enumerateStatistics(from: current, to: current) { statics, stop in
                    if let qu = statics.sumQuantity(){
                        step += Int(qu.doubleValue(for: .kilocalorie()))
                    }
                }
                DispatchQueue.main.async {
                    let goal = realm.objects(Kcal.self).first?.kcal ?? .init()
                    let isComplete = goal < step
                    let model = Record(date: current.formatTime(), kcal: step, isComplete: isComplete)
                    try! realm.write{
                        realm.add(model)
                    }
                }
            }
        }
    }
}
