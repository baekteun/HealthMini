//
//  getSleepTimeMethod.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

import RealmSwift
import HealthKit

extension DefaultHealthRepository{
    func getSleepTimeMethod(completion: @escaping ((Int?, Error?)) -> Void) {
        let formattedToday = Date().formatTime()
        let current = Date()
        print(formattedToday, current)
        let predicate = HKQuery.predicateForSamples(withStart: formattedToday, end: current, options: .strictStartDate)
        
        guard let sleep = HKSampleType.categoryType(forIdentifier: .sleepAnalysis) else { return }
        let query = HKSampleQuery(
            sampleType: sleep,
            predicate: predicate,
            limit: 0,
            sortDescriptors: nil
        ) { _, data, err in
            if let err = err{
                completion((nil, err))
            }
            if let data = data{
                var hour = 0
                data
                    .compactMap { $0 as? HKCategorySample }
                    .filter{ $0.value == HKCategoryValueSleepAnalysis.asleep.rawValue}
                    .forEach { sample in
                        let seconds = sample.endDate.timeIntervalSince(sample.startDate)
                        print(sample.startDate, sample.endDate)
                        let minutes = seconds/60.0
                        let hours = minutes/60.0
                        print(seconds, minutes, hour)
                        hour += Int(hours)
                    }
                completion((hour, nil))
            }
        }
        store.execute(query)
    }
}
