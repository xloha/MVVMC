//
//  MainComponent.swift
//  XlohaGround
//
//  Created by xloha on 2024/01/08.
//

import Foundation

protocol MainDependency: Dependency {

}

final class MainComponent:
    Component<MainDependency>,
    MainViewModelDependency,
    SettingDependency
{
    let customerName: String

    init(
        dependency: MainDependency,
        customerName: String
    ) {
        self.customerName = customerName
        super.init(dependency: dependency)
    }
}
