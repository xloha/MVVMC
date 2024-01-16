//___FILEHEADER___

import UIKit
import RxSwift
import RxCocoa

// MARK: - ___VARIABLE_productName___Coordinatable

protocol ___VARIABLE_productName___Coordinatable: Coordinatable {
    // TODO: Declare transition event
}

protocol ___VARIABLE_productName___ParentCoordinatorBindable: ParentCoordinatorBindable {
    // TODO: Declare bind transition event to parent coordinator
}

// MARK: - ___VARIABLE_productName___Coordinator

final class ___VARIABLE_productName___Coordinator:
    DIContainer<___VARIABLE_productName___Component>,
    Coordinator,
    ___VARIABLE_productName___Coordinatable,
    ___VARIABLE_productName___ParentCoordinatorBindable
{
    var navigationController: UINavigationController

    init(
        component: ___VARIABLE_productName___Component,
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
        super.init(component: component)

        bindCoordinateLogic()
    }

    func start(_ presentationType: PresentationType) {
        // TODO: - Create viewModel & viewController and start viewController
    }
}

private extension ___VARIABLE_productName___Coordinator {
    func bindCoordinateLogic() {
        // TODO: - Bind coordinate Logic
    }
}
