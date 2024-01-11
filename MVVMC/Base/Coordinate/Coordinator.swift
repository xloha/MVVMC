//
//  Coordinator.swift
//  MVVMC
//
//  Created by xloha on 2024/01/05.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }

    func start(_ presentationType: PresentationType)
}
