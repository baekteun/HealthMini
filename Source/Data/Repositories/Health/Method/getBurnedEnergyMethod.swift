//
//  getBurnedEnergyMethod.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

import RealmSwift
import HealthKit

extension DefaultHealthRepository{
    func getBurnedEnergyMethod(completion: @escaping(([KcalWithDay]?, Error?)) -> Void){
        let realm = try! Realm()
        let startDay = realm.objects(StartDay.self).first?.startDay ?? .init()
        let endDay = Date()
        DispatchQueue.main.async {
            guard let step = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned) else { return }
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
                    var steps: [KcalWithDay] = []
                    res.enumerateStatistics(from: startDay, to: endDay) { statics, stop in
                        
                        if let qu = statics.sumQuantity(){
                            steps.append(.init(date: statics.startDate, sleepTime: Int(qu.doubleValue(for: .kilocalorie()))))
                        }
                    }
                    completion((steps, nil))
                }
            }
            completion(([],nil))
        }
    }
}
