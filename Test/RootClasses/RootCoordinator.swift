//
//  RootCoordinator.swift
//  Test
//
//  Created by Turker GUNEY on 3.12.2020.
//

import UIKit

class RootCoordinator: Coordinator {
  
  var parentCoordinator:Coordinator?
  var childCoordinators: [Coordinator] = [Coordinator]()
  var navigationController: UINavigationController
  
  init(_ navigationController:UINavigationController) {
    self.navigationController = navigationController
    
  }
  
  func start() {
    pushMainPageVC()
  }
  
  func addChild(child: Coordinator) {
    child.parentCoordinator = self
    childCoordinators.append(child)
    child.start()
  }
  
  func removeChild(childClass: AnyObject) {
    for (index,item) in childCoordinators.enumerated() {
      if type(of: item) === childClass {
        childCoordinators.remove(at: index)
      }
    }
  }
}
extension RootCoordinator {
    func pushMainPageVC(){
        let vc = MainPageVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    func pushDetailPage(loginID:String){
        let vc = DetailPage()
        vc.loginID = loginID
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}

