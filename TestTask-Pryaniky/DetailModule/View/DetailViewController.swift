//
//  DetailViewController.swift
//  TestTask-Pryaniky
//
//  Created by admin on 18.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet private var pictureView: UIView!
    @IBOutlet private var infoLabel: UILabel!
    @IBOutlet private var pictureImageView: UIImageView!
    //MARK: - Property
    var presenter: DetailViewPresenterProtocol!
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.startImage()
        presenter.startData()
        presenter.startVarinats()
        navigationController?.navigationBar.isHidden = true
    }
    //MARK: - Action
    @IBAction private func backAction(_ sender: Any) {
        presenter.tap()
    }
}

extension DetailViewController: DetailViewProtocol {
    //MARK: - Functions
    func setData(infoData: ArrayData?) {
        let text = infoData?.data.text
        infoLabel.text = text
    }
    
    func setImage(infoData: ArrayData?, image: UIImage?) {
        let text = infoData?.data.text
        infoLabel.text = text
        pictureImageView.image = image
    }
    
    func setVarinats(varinat: String?) {
        infoLabel.text = varinat
    }
}
