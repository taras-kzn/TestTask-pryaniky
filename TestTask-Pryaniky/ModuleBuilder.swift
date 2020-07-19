//
//  ModuleBuilder.swift
//  TestTask-Pryaniky
//
//  Created by admin on 18.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
//MARK: - Protocol
protocol AssemblyBuilderProtocol {
    func creatMainModule(router: RouterProtocol) -> UIViewController
    func creatDetailModule(infoData: ArrayData?, router: RouterProtocol) -> UIViewController
}

class ModuleBuilder: AssemblyBuilderProtocol {
    
    func creatMainModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networService, router: router)
        view.presenter = presenter
        return view
    }
    
    func creatDetailModule(infoData: ArrayData?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, router: router, infoData: infoData)
        view.presenter = presenter
        return view
    }
}


