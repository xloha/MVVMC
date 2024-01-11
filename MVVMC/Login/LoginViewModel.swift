//
//  LoginViewModel.swift
//  XlohaGround
//
//  Created by xloha on 2024/01/05.
//

import RxSwift
import RxRelay

// MARK: - Dependency

protocol LoginViewModelDependency: ViewModelDependency {
    var loginType: String { get }
}

protocol LoginViewModelInput {
    var loginButtonDidTapped: PublishRelay<Void> { get }
}

protocol LoginViewModelOutput {
    var loginType: BehaviorRelay<String> { get }
}

// MARK: - ViewModelLogic

typealias LoginViewModelLogic = LoginViewModelInput & LoginViewModelOutput

class LoginViewModel:
    ViewModel<LoginViewModelDependency, LoginCoordinateLogic>,
    LoginViewModelLogic
{
    private let disposeBag = DisposeBag()

    // MARK: - LoginViewModelInput

    var loginButtonDidTapped: PublishRelay<Void> = .init()

    // MARK: - LoginViewModelOutput

    var loginType: BehaviorRelay<String>

    override init(
        dependency: LoginViewModelDependency,
        coordinator: LoginCoordinateLogic
    ) {
        self.loginType = .init(value: dependency.loginType)
        super.init(dependency: dependency, coordinator: coordinator)

        bindInput()
    }

    func bindInput() {
        loginButtonDidTapped
            .bind(to: coordinator.routeToMain)
            .disposed(by: disposeBag)
    }
}
