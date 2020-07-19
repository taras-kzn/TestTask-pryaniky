//
//  DetailViewController.swift
//  TestTask-Pryaniky
//
//  Created by admin on 18.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var pictureView: UIView!
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var pictureImageView: UIImageView!
    
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.startImage()
        presenter.startData()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setData(infoData: ArrayData?) {
        let text = infoData?.data.text
        infoLabel.text = text
    }
    
    func setImage(infoData: ArrayData?, image: UIImage?) {
        let text = infoData?.data.text
        infoLabel.text = text
        pictureImageView.image = image
    }
}
