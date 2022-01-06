//
//  RecordVM.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

final class RecordVM: baseViewModel{
    // MARK: - Properties
    
    private let getBurnedEnergyUseCase: GetBurnedEnergyUseCase
    
    var recordDatasources: [KcalWithDay] = []
    
    // MARK: - Init
    override init(coordinator: baseCoordinator) {
        self.getBurnedEnergyUseCase = AppDI.shared.getDefaultGetBurnedEnergyUseCase()
        super.init(coordinator: coordinator)
    }
    
    // MARK: - Method
    func viewDidAppear() {
        getBurnedEnergyUseCase.execute { data, err in
            if let err = err{
                print(err.localizedDescription)
                return
            }
            print("ASDF")
            print(data)
        }
    }
}
