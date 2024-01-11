//
//  PresentationType.swift
//  MVVMC
//
//  Created by xloha on 2024/01/11.
//

enum PresentationType {
    case present(animated: Bool)
    case push(animated: Bool)
    case setVC(animated: Bool)
}
