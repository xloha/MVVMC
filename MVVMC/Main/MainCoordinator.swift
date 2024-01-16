//
//  MainCoordinator.swift
//  XlohaGround
//
//  Created by xloha on 2024/01/05.
//

import UIKit
import RxSwift
import RxCocoa

protocol MainCoordinatable: Coordinatable {
    var routeToLogin: PublishRelay<Void> { get }
    var routeToProfile: PublishRelay<Void> { get }
    var routeToSetting: PublishRelay<Void> { get }
}

protocol MainParentCoordinatorBindable: ParentCoordinatorBindable {
    func bindRouteToLogin(_ loginRouter: PublishRelay<PresentationType>)
}

final class MainCoordinator:
    DIContainer<MainComponent>,
    Coordinator,
    MainCoordinatable,
    MainParentCoordinatorBindable
{
    var navigationController: UINavigationController
    private let disposeBag = DisposeBag()

    // MARK: - MainCoordinateLogic

    var routeToLogin: PublishRelay<Void> = .init()
    var routeToProfile: PublishRelay<Void> = .init()
    var routeToSetting: PublishRelay<Void> = .init()

    init(
        component: MainComponent,
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
        super.init(component: component)

        bindCoordinateLogic()
    }

    func start(_ presentationType: PresentationType)  {
        let viewModel = MainViewModel(
            dependency: component,
            coordinator: self
        )
        let viewController = MainViewController(viewModel: viewModel)
        viewController.modalPresentationStyle = .fullScreen

        navigationController.start(
            viewController,
            presentationType: presentationType
        )
    }

    // MARK: - MainParentCoordinatorBindable

    func bindRouteToLogin(_ loginRouter: PublishRelay<PresentationType>) {
        routeToLogin
            .map { _ in .setVC(animated: true)}
            .bind(to: loginRouter)
            .disposed(by: disposeBag)
    }
}

private extension MainCoordinator {
    func bindCoordinateLogic() {
        routeToProfile
            .bind(with: self) { owner, _ in
                owner.navigateToProfile(.push(animated: true))
            }
            .disposed(by: disposeBag)

        routeToSetting
            .bind(with: self) { owner, _ in
                owner.navigateToSetting(.push(animated: true))
            }
            .disposed(by: disposeBag)
    }

    func navigateToProfile(_ presentationType: PresentationType) {
        navigationController.start(
            ProfileViewController(),
            presentationType: presentationType
        )
    }

    func navigateToSetting(_ presentationType: PresentationType) {
        let component = SettingComponent(dependency: component)
        let coordinator = SettingCoordinator(
            component: component,
            navigationController: navigationController
        )
        coordinator.start(presentationType)
    }
}
