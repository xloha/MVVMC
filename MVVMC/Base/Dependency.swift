//
//  Dependency.swift
//  MVVMC
//
//  Created by xloha on 2024/01/08.
//

import Foundation

/// The base dependency protocol.
///
/// Subclasses should define a set of properties that are required by the module from the DI graph. A dependency is
/// typically provided and satisfied by its immediate parent module.
public protocol Dependency: AnyObject {}

/// The special empty dependency.
public protocol EmptyDependency: Dependency {}

/// The base viewmodel dependency protocol.
public protocol ViewModelDependency: AnyObject {}
