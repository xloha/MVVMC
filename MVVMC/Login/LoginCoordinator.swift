//
//  LoginCoordinator.swift
//  XlohaGround
//
//  Created by xloha on 2024/01/05.
//

import UIKit
import RxSwift
import RxCocoa

protocol LoginCoordinatable: Coordinatable {
    var routeToMain: PublishRelay<Void> { get }
}

protocol LoginParentCoordinatorBindable: ParentCoordinatorBindable {
    func bindRouteToMain(_ mainRouter: PublishRelay<String>)
}

final class LoginCoordinator:
    DIContainer<LoginComponent>,
    Coordinator,
    LoginCoordinatable,
    LoginParentCoordinatorBindable
{
    var navigationController: UINavigationController

    private let disposeBag = DisposeBag()

    // MARK: - LoginCoordinateLogic

    var routeToMain: PublishRelay<Void> = .init()

    init(
        component: LoginComponent,
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
        super.init(component: component)
    }

    func start(_ presentationType: PresentationType) {
        let viewModel = LoginViewModel(
            dependency: component,
            coordinator: self
        )
        let viewController = LoginViewController(viewModel: viewModel)
        viewController.modalPresentationStyle = .fullScreen
        
        navigationController.start(
            viewController,
            presentationType: presentationType
        )
    }

    // MARK: - LoginParentCoordinatorBindable

    func bindRouteToMain(_ mainRouter: PublishRelay<String>) {
        routeToMain
            .map { _ in "XLOHA" }
            .bind(to: mainRouter)
            .disposed(by: disposeBag)
    }
}
