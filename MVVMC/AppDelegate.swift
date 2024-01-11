//
//  AppDelegate.swift
//  MVVMC
//
//  Created by xloha on 2024/01/11.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        coordinator = AppCoordinator(component: AppComponent())

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = coordinator?.navigationController
        window?.makeKeyAndVisible()

        coordinator?.start(.setVC(animated: true))

        return true
    }
}

