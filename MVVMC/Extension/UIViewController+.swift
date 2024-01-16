//
//  UIViewController+.swift
//  MVVMC
//
//  Created by xloha on 2024/01/11.
//

import UIKit

extension UIViewController {
    func start(
        _ viewControllerToPresent: UIViewController,
        presentationType: PresentationType
    ) {
        switch presentationType {
        case .present(let animated):
            present(
                viewControllerToPresent,
                animated: animated
            )
        case .push(let animated):
            if let navigationController = self as? UINavigationController {
                navigationController.pushViewController(
                    viewControllerToPresent,
                    animated: animated
                )
            }
        case .setVC(let animated):
            if let navigationController = self as? UINavigationController {
                navigationController.setViewControllers(
                    [viewControllerToPresent],
                    animated: animated
                )
            }
        }
    }
}
