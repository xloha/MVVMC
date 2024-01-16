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

protocol AppCoordinatable: Coordinatable {
    var routeToLogin: PublishRelay<PresentationType> { get }
    var routeToMain: PublishRelay<String> { get }
}

class AppCoordinator:
    DIContainer<AppComponent>,
    Coordinator,
    AppCoordinatable
{
    var navigationController: UINavigationController = UINavigationController(
        rootViewController: ViewController()
    )
    private let disposeBag = DisposeBag()

    // MARK: - AppCoordinateLogic

    var routeToLogin: PublishRelay<PresentationType> = .init()
    var routeToMain: PublishRelay<String> = .init()


    override init(component: AppComponent) {
        super.init(component: component)

        bindCoordinateLogic()
    }

    func start(_ presentationType: PresentationType) {
        routeToLogin.accept(presentationType)
    }
}

private extension AppCoordinator {
    func bindCoordinateLogic() {
        routeToLogin.bind(with: self) { owner, presentationType in
            owner.navigateToLogin(presentationType)
        }
        .disposed(by: disposeBag)

        routeToMain.bind(with: self) { owner, name in
            owner.navigateToMain(
                name: name,
                presentationType: .setVC(animated: true)
            )
        }
        .disposed(by: disposeBag)
    }

    func navigateToLogin(_ presentationType: PresentationType) {
        let component = LoginComponent(dependency: component)
        let coordinator = LoginCoordinator(
            component: component,
            navigationController: navigationController
        )

        coordinator.bindRouteToMain(routeToMain)
        coordinator.start(presentationType)
    }

    func navigateToMain(name: String, presentationType: PresentationType) {
        let component = MainComponent(
            dependency: component,
            customerName: name
        )
        let coordinator = MainCoordinator(
            component: component,
            navigationController: navigationController
        )

        coordinator.bindRouteToLogin(routeToLogin)
        coordinator.start(presentationType)
    }
}
