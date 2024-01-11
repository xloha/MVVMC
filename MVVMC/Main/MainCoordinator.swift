//
//  MainCoordinator.swift
//  XlohaGround
//
//  Created by xloha on 2024/01/05.
//

import UIKit
import RxSwift
import RxCocoa

protocol MainCoordinateLogic: CoordinateLogic {
    var routeToLogin: PublishRelay<Void> { get }
    var routeToProfile: PublishRelay<Void> { get }
    var routeToSetting: PublishRelay<Void> { get }
}

protocol MainCompletionCoordinateLogic: CoordinateCompletionLogic {
    var routeToLogin: PublishRelay<PresentationType> { get }
}

final class MainCoordinator:
    DIContainer<MainComponent>,
    Coordinator,
    MainCoordinateLogic
{
    var navigationController: UINavigationController
    weak var mainCompletionCoordinateLogic: MainCompletionCoordinateLogic?
    private let disposeBag = DisposeBag()

    // MARK: - MainCoordinateLogic

    var routeToLogin: PublishRelay<Void> = .init()
    var routeToProfile: PublishRelay<Void> = .init()
    var routeToSetting: PublishRelay<Void> = .init()

    init(
        component: MainComponent,
        navigationController: UINavigationController,
        mainCompletionCoordinateLogic: MainCompletionCoordinateLogic
    ) {
        self.navigationController = navigationController
        self.mainCompletionCoordinateLogic = mainCompletionCoordinateLogic
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

        navigationController.present(
            viewController,
            presentationType: presentationType
        )
    }

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

        if let mainCompletionCoordinateLogic {
            routeToLogin
                .map { _ in .setVC(animated: true) }
                .bind(to: mainCompletionCoordinateLogic.routeToLogin)
                .disposed(by: disposeBag)
        }
    }
}

private extension MainCoordinator {
    func navigateToProfile(_ presentationType: PresentationType) {
        navigationController.present(ProfileViewController(), presentationType: presentationType)
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
