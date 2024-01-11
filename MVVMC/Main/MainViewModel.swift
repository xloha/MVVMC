//
//  MainViewModel.swift
//  XlohaGround
//
//  Created by xloha on 2024/01/05.
//

import Foundation
import RxSwift
import RxRelay

// MARK: - Dependency

protocol MainViewModelDependency: ViewModelDependency {
    var customerName: String { get }
}

protocol MainViewModelInput {
    var logoutButtonDidTapped: PublishRelay<Void> { get }
    var profileButtonDidTapped: PublishRelay<Void> { get }
    var settingButtonDidTapped: PublishRelay<Void> { get }
}

protocol MainViewModelOutput {
    var customerName: BehaviorRelay<String> { get }
}

// MARK: - ViewModelLogic

typealias MainViewModelLogic = MainViewModelInput & MainViewModelOutput

class MainViewModel:
    ViewModel<MainViewModelDependency, MainCoordinateLogic>,
    MainViewModelLogic
{
    private let disposeBag = DisposeBag()

    // MARK: - MainViewModelInput

    var logoutButtonDidTapped: PublishRelay<Void> = .init()
    var profileButtonDidTapped: PublishRelay<Void> = .init()
    var settingButtonDidTapped: PublishRelay<Void> = .init()

    // MARK: - MainViewModelOutput

    var customerName: BehaviorRelay<String>

    override init(dependency: MainViewModelDependency, coordinator: MainCoordinateLogic) {
        self.customerName = .init(value: dependency.customerName)
        super.init(dependency: dependency, coordinator: coordinator)

        bindInput()
    }

    func bindInput() {
        logoutButtonDidTapped
            .bind(to: coordinator.routeToLogin)
            .disposed(by: disposeBag)

        profileButtonDidTapped
            .bind(to: coordinator.routeToProfile)
            .disposed(by: disposeBag)

        settingButtonDidTapped
            .bind(to: coordinator.routeToSetting)
            .disposed(by: disposeBag)
    }
}

