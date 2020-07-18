//
//  DetailPresenter.swift
//  TestTask-Pryaniky
//
//  Created by admin on 18.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
//MARK: - protocol
protocol DetailViewProtocol: class {
    func setData(infoData: ArrayData?)
}

protocol DetailViewPresenterProtocol: class {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol,infoData: ArrayData?)
    func startData()
}

class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol?
    let networService: NetworkServiceProtocol
    var infoData: ArrayData?
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, infoData: ArrayData?) {
        self.view = view
        self.networService = networkService
        self.infoData = infoData
    }
    
    public func startData() {
        self.view?.setData(infoData: infoData)
    }
}
