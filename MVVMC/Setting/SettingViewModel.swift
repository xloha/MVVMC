//
//  SettingViewModel.swift
//  MVVMC
//
//  Created by xloha on 2024/01/11.
//

import RxSwift
import RxRelay

// MARK: - Dependency

protocol SettingViewModelDependency: ViewModelDependency {
    // TODO: Declare the set of dependencies required by this viewmodel
}

// MARK: - ViewModelInput

protocol SettingViewModelInput {
    // TODO: Declare input the viewController can invoke
}

// MARK: - ViewModelOutput

protocol SettingViewModelOutput {
    // TODO: Declare output the viewController needed
}

// MARK: - ViewModelLogic

typealias SettingViewModelLogic = SettingViewModelInput & SettingViewModelOutput

// MARK: - ViewModel

final class SettingViewModel:
    ViewModel<SettingViewModelDependency, SettingCoordinateLogic>,
    SettingViewModelLogic
{
    private let disposeBag = DisposeBag()

    // TODO: - Bind Input & Output
}
