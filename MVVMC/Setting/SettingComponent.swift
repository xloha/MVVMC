//
//  SettingComponent.swift
//  MVVMC
//
//  Created by xloha on 2024/01/11.
//

import Foundation

// MARK: - SettingComponent

protocol SettingDependency: Dependency {
    // TODO: Declare the set of dependencies required by this product, but won't be created by this product.
}

// MARK: - SettingComponent

final class SettingComponent:
    Component<SettingDependency>,
    SettingViewModelDependency
{
    // TODO: Declare 'fileprivate' dependencies that are only used by this product.
}
