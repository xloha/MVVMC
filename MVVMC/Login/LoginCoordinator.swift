//
//  LoginCoordinator.swift
//  XlohaGround
//
//  Created by xloha on 2024/01/05.
//

import UIKit
import RxSwift
import RxCocoa

protocol LoginCoordinateLogic: CoordinateLogic {
    var routeToMain: PublishRelay<Void> { get }
}

// Note: If Needed
protocol LoginCompletionCoordinateLogic: CoordinateCompletionLogic {
    var didFinishLogin: PublishRelay<String> { get }
}

final class LoginCoordinator:
    DIContainer<LoginComponent>,
    Coordinator,
    LoginCoordinateLogic
{
    var navigationController: UINavigationController
    weak var loginCompletionDelegate: LoginCompletionCoordinateLogic?

    private let disposeBag = DisposeBag()

    // MARK: - LoginCoordinateLogic

    var routeToMain: PublishRelay<Void> = .init()

    init(
        component: LoginComponent,
        navigationController: UINavigationController,
        loginCompletionDelegate: LoginCompletionCoordinateLogic
    ) {
        self.navigationController = navigationController
        self.loginCompletionDelegate = loginCompletionDelegate
        super.init(component: component)

        bindCoordinateLogic()
    }

    func start(_ presentationType: PresentationType) {
        let viewModel = LoginViewModel(
            dependency: component,
            coordinator: self
        )
        let viewController = LoginViewController(viewModel: viewModel)
        viewController.modalPresentationStyle = .fullScreen
        
        navigationController.present(
            viewController,
            presentationType: presentationType
        )
    }

    func bindCoordinateLogic() {
        if let loginCompletionDelegate {
            routeToMain
                .map { _ in "XLOHA" }
                .bind(to: loginCompletionDelegate.didFinishLogin)
                .disposed(by: disposeBag)
        }
    }
}
