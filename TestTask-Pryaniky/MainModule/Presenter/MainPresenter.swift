//
//  MainPresenter.swift
//  TestTask-Pryaniky
//
//  Created by admin on 18.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
//MARK: - Protocol
protocol MainViewProtocol: class {
    func succes()
    func failure(error: Error)
}

protocol MainViewPresenterProtcol: class {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getPryaniky()
    func tapOnTheInfoData(infoData: ArrayData?)
    var pryaniky: Pryaniky? { get set }
}

//MARK: - Class Presenter
class MainPresenter: MainViewPresenterProtcol {
    //MARK: - Properties
    private weak var view: MainViewProtocol?
    private var router: RouterProtocol?
    private let networkService: NetworkServiceProtocol!
    var pryaniky: Pryaniky?
    
    //MARK: - init
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getPryaniky()
    }
    //MARK: - Functions
    func getPryaniky() {
        networkService.getData { [weak self] result in
            guard let self = self  else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.pryaniky = data
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func tapOnTheInfoData(infoData: ArrayData?) {
        router?.showDatail(infoData: infoData)
    }
}


