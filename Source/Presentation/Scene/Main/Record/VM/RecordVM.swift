//
//  RecordVM.swift
//  HealthMini
//
//  Created by 최형우 on 2022/01/06.
//  Copyright © 2022 baegteun. All rights reserved.
//

final class RecordVM: baseViewModel{
    // MARK: - Properties
    
    private let getRecordsUseCase: GetRecordsUseCase
    
    var recordDatasources = Observable([Record]())
    
    // MARK: - Init
    override init(coordinator: baseCoordinator) {
        self.getRecordsUseCase = AppDI.shared.getDefaultGetRecordsUseCase()
        super.init(coordinator: coordinator)
    }
    
    // MARK: - Method
    func viewDidAppear() {
        getRecordsUseCase.execute { records, err in
            if let err = err{
                print(err.localizedDescription)
                return
            }
            
            self.recordDatasources.value = records ?? []
        }
    }
}
