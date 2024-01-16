//
//  SettingCoordinator.swift
//  MVVMC
//
//  Created by xloha on 2024/01/11.
//

import UIKit
import RxSwift
import RxCocoa

// MARK: - SettingCoordinateLogic

protocol SettingCoordinatable: Coordinatable {
    // TODO: Declare CoordinateLogic
}

// MARK: - SettingCoordinator

final class SettingCoordinator:
    DIContainer<SettingComponent>,
    Coordinator,
    SettingCoordinatable
{
    var navigationController: UINavigationController

    init(
        component: SettingComponent,
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
        super.init(component: component)

        bindCoordinateLogic()
    }

    func start(_ presentationType: PresentationType) {
        let viewModel = SettingViewModel(
            dependency: component,
            coordinator: self
        )
        let viewController = SettingViewController(viewModel: viewModel)

        navigationController.start(
            viewController,
            presentationType: presentationType
        )
    }
}

private extension SettingCoordinator {
    func bindCoordinateLogic() {
        // TODO: - Bind Coordinate Logic
    }
}
