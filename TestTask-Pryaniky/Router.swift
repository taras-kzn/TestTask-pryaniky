//
//  Router.swift
//  TestTask-Pryaniky
//
//  Created by admin on 19.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
//MARK: - Protocol
protocol RouterMain {
    //MARK: - Properties
    var navigationViewController : UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    //MARK: - Functions
    func initialViewController()
    func showDatail(infoData: ArrayData?)
    func popToRoot()
}
//MARK: - Class
class Router: RouterProtocol {
    //MARK: - Properties
    var navigationViewController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    //MARK: - Init
    init(navigationViewController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationViewController = navigationViewController
        self.assemblyBuilder = assemblyBuilder
    }
    //MARK: - Functions
    func initialViewController() {
        if let navigationViewController = navigationViewController {
            guard let mainViewController = assemblyBuilder?.creatMainModule(router: self) else { return }
            navigationViewController.viewControllers = [mainViewController]
        }
    }
    
    func showDatail(infoData: ArrayData?) {
        if let navigationViewController = navigationViewController {
            guard let detailViewController = assemblyBuilder?.creatDetailModule(infoData: infoData, router: self) else { return }
            navigationViewController.pushViewController(detailViewController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationViewController = navigationViewController {
            navigationViewController.popToRootViewController(animated: true)
        }
    }
}


