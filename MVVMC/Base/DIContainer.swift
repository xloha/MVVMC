//
//  DIContainer.swift
//  MVVMC
//
//  Created by xloha on 2024/01/08.
//

class DIContainer<Component> {
    public let component: Component

    public init(component: Component) {
        self.component = component
    }
}
