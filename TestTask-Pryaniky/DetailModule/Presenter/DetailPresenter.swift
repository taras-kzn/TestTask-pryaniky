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
}

protocol DetailViewPresenterProtocol: class {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol,infoData: ArrayData?)
    func startData()
    func startImage()
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
    
    public func startImage() {
        networService.downloadImage(url: infoData?.data.url) { [weak self] image in
            guard let self = self  else { return }
            DispatchQueue.main.async {
                self.view?.setImage(infoData: self.infoData, image: image)
            }
        }
    }
}
