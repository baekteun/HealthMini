//
//  MainVM.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/04.
//  Copyright © 2022 baegteun. All rights reserved.
//

import UIKit
import RealmSwift

enum HealthKind: String{
    case WALKING
    case RECORD
    case SLEEP
}

final class MainVM: baseViewModel{
    // MARK: - Init
    override init(coordinator: baseCoordinator) {
        self.getStartDayUseCase = AppDI.shared.getDefaultGetStartDayUseCase()
        self.getTodayExerciseUseCase = AppDI.shared.getDefaultGetTodayExerciseUseCase()
        super.init(coordinator: coordinator)
    }
    
    // MARK: - Properties
    private let getStartDayUseCase: GetStartDayUseCase
    private let getTodayExerciseUseCase: GetTodayExerciseUseCase
    var dataSource = Observable([HealthKind]())
    var totalGaol = Observable((Date(), 0))
    var chartData = Observable([KcalWithDay]())
    
    // MARK: - Method
    func setDatasource(data: [HealthKind]) {
        self.dataSource.value = data
    }
    
    func viewDidAppear() {
        let realm = try! Realm()
        let goal = realm.objects(Kcal.self).first?.kcal ?? 0
        self.totalGaol.value.0 = getStartDayUseCase.execute()
        
        self.getTodayExerciseUseCase.execute { exer, err in
            if let err = err{
                print(err.localizedDescription)
                return
            }
            self.chartData.value = exer ?? []
            self.totalGaol.value.1 = exer?.filter{ $0.burnedKcal >= goal }.count ?? 0
        }
        
        
    }
    
    func cellDidSelect(index: IndexPath) -> String{
        let selected = self.dataSource.value[index.row]
        switch selected{
        case .WALKING:
            coordinator.navigate(to: .walkingIsRequired)
        case .RECORD:
            coordinator.navigate(to: .recordIsRequired)
        case .SLEEP:
            coordinator.navigate(to: .sleepIsRequired)
        }
        return selected.rawValue
    }
}
