//___FILEHEADER___

import UIKit
import RxSwift
import RxCocoa

// MARK: - ___VARIABLE_productName___CoordinateLogic

protocol ___VARIABLE_productName___CoordinateLogic: CoordinateLogic {
    // TODO: Declare CoordinateLogic
}

// MARK: - ___VARIABLE_productName___Coordinator

final class ___VARIABLE_productName___Coordinator:
    DIContainer<___VARIABLE_productName___Component>,
    Coordinator,
    ___VARIABLE_productName___CoordinateLogic
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
        // TODO: - Create ViewModel & ViewController And Present ViewController
    }
}

private extension ___VARIABLE_productName___Coordinator {
    func bindCoordinateLogic() {
        // TODO: - Bind Coordinate Logic
    }
}
