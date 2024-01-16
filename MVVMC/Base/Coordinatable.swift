//
//  Coordinatable.swift
//  MVVMC
//
//  Created by xloha on 2024/01/08.
//

/// Each Coordinator should conform Coordinatable
protocol Coordinatable: AnyObject { }

/// parent coordinator should bind ParentCoordinatorBindable
protocol ParentCoordinatorBindable: AnyObject { }
