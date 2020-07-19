//
//  DetailPresenter.swift
//  TestTask-Pryaniky
//
//  Created by admin on 18.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
//MARK: - protocol
protocol DetailViewProtocol: class {
    func setData(infoData: ArrayData?)
    func setImage(infoData: ArrayData?, image: UIImage?)
    func setVarinats(varinat: String?)
}

protocol DetailViewPresenterProtocol: class {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol,router: RouterProtocol ,infoData: ArrayData?)
    func startData()
    func startImage()
    func startVarinats()
    func tap()
}
//MARK: - Class
class DetailPresenter: DetailViewPresenterProtocol {
    //MARK: - Propertise
    private weak var view: DetailViewProtocol?
    private let networService: NetworkServiceProtocol
    private var router: RouterProtocol?
    var infoData: ArrayData?
    //MARK: - Init
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol,router: RouterProtocol, infoData: ArrayData?) {
        self.view = view
        self.networService = networkService
        self.infoData = infoData
        self.router = router
    }
    //MARK: - Functions
    public func startData() {
        self.view?.setData(infoData: infoData)
    }
    
    public func startImage() {
        networService.downloadImage(url: infoData?.data.url) { [weak self] image in
            guard let self = self  else { return }
            DispatchQueue.main.async {
                self.view?.setImage(infoData: self.infoData, image: image)
            }
        }
    }
    
    public func startVarinats() {
        guard let array = infoData?.data.variants else { return }
        DispatchQueue.main.async {
            for varinats in array {
                if self.infoData?.data.selectedId == varinats.id {
                    let varinat = varinats.text
                    self.view?.setVarinats(varinat: varinat)
                }
            }
        }
    }
    
    func tap() {
        router?.popToRoot()
    }
}
