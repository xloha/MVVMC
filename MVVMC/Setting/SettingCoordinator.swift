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

protocol SettingCoordinateLogic: CoordinateLogic {
    // TODO: Declare CoordinateLogic
}

// MARK: - SettingCoordinator

final class SettingCoordinator:
    DIContainer<SettingComponent>,
    Coordinator,
    SettingCoordinateLogic
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

        navigationController.present(
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
