//
//  Coordinator.swift
//  Test
//
//  Created by Turker GUNEY on 3.12.2020.
//

import UIKit

public protocol Coordinator:AnyObject {
    var childCoordinators: [Coordinator] {get set}
    var navigationController:UINavigationController {get set}
    var parentCoordinator:Coordinator? { get set}
    
    func start()
    
    func addChild(child:Coordinator)
    func removeChild(childClass:AnyObject)
    
}
public extension Coordinator {
    func addChild(child:Coordinator){}
    func removeChild(childClass:AnyObject){}
}

