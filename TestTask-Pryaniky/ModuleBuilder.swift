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
}

class ModuleBuilder: Builder {
    static func creatMainModule() -> UIViewController {
        let view = MainViewController()
        let networService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networService)
        view.presenter = presenter
        return view
    }
}


