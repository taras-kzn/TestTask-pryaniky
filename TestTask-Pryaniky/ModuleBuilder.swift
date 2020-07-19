//
//  ModuleBuilder.swift
//  TestTask-Pryaniky
//
//  Created by admin on 18.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
//MARK: - Protocol
protocol Builder {
    static func creatMainModule() -> UIViewController
    static func creatDetailModule(infoData: ArrayData?) -> UIViewController
}

class ModuleBuilder: Builder {
    
    static func creatMainModule() -> UIViewController {
        let view = MainViewController()
        let networService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networService)
        view.presenter = presenter
        return view
    }
    
    static func creatDetailModule(infoData: ArrayData?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, infoData: infoData)
        view.presenter = presenter
        return view
    }
}


