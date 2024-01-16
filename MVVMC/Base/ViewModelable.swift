//
//  ViewModelable.swift
//  MVVMC
//
//  Created by xloha on 2024/01/08.
//

public protocol ViewModelable: AnyObject {}

open class ViewModel<DependencyType, CoordinatorType>: ViewModelable {
    public let dependency: DependencyType
    public let coordinator: CoordinatorType

    public init(
        dependency: DependencyType,
        coordinator: CoordinatorType
    ) {
        self.dependency = dependency
        self.coordinator = coordinator
    }
}
