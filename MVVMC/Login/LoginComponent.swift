//
//  LoginComponent.swift
//  XlohaGround
//
//  Created by xloha on 2024/01/08.
//

protocol LoginDependency: Dependency {
    var loginType: String { get }
}

final class LoginComponent:
    Component<LoginDependency>,
    LoginViewModelDependency
{
    var loginType: String { dependency.loginType }
}
