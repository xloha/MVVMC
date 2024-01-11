//
//  AppCoordinator.swift
//  MVVMC
//
//  Created by xloha on 2024/01/11.
//

import UIKit
import RxSwift
import RxCocoa

final class AppComponent:
    EmptyDependency,
    LoginDependency,
    MainDependency
{
    var loginType: String = "FACE_ID"
}

protocol AppCoordinateLogic:
    CoordinateLogic
{
    var routeToLogin: PublishRelay<PresentationType> { get }
}

class AppCoordinator:
    DIContainer<AppComponent>,
    Coordinator,
    AppCoordinateLogic,
    LoginCompletionCoordinateLogic,
    MainCompletionCoordinateLogic
{
    var navigationController: UINavigationController = UINavigationController(
        rootViewController: ViewController()
    )
    private let disposeBag = DisposeBag()

    // MARK: - AppCoordinateLogic & MainCompletionCoordinateLogic

    var routeToLogin = PublishRelay<PresentationType>()

    // MARK: - LoginCompletionCoordinateLogic

    var didFinishLogin: PublishRelay<String> = .init()


    override init(component: AppComponent) {
        super.init(component: component)

        bindCoordinateLogic()
    }

    func start(_ presentationType: PresentationType) {
        routeToLogin.accept(presentationType)
    }

    func bindCoordinateLogic() {
        routeToLogin.bind(with: self) { owner, presentationType in
            owner.navigateToLogin(presentationType)
        }
        .disposed(by: disposeBag)

        didFinishLogin.bind(with: self) { owner, name in
            owner.navigateToMain(
                name: name,
                presentationType: .setVC(animated: true)
            )
        }
        .disposed(by: disposeBag)
    }
}

private extension AppCoordinator {
    func navigateToLogin(_ presentationType: PresentationType) {
        let component = LoginComponent(dependency: component)
        let coordinator = LoginCoordinator(
            component: component,
            navigationController: navigationController,
            loginCompletionDelegate: self
        )
        coordinator.start(presentationType)
    }

    func navigateToMain(name: String, presentationType: PresentationType) {
        let component = MainComponent(
            dependency: component,
            customerName: name
        )
        let coordinator = MainCoordinator(
            component: component,
            navigationController: navigationController,
            mainCompletionCoordinateLogic: self
        )

        coordinator.start(presentationType)
    }
}
