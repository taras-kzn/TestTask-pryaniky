//
//  MainTableViewCell.swift
//  TestTask-Pryaniky
//
//  Created by admin on 17.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

final class MainTableViewCell: UITableViewCell {
    
    @IBOutlet private var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        infoLabel.text = nil
    }
    
    func congigure(model: ArrayData?) {
        guard let name = model?.name else { return }
        infoLabel.text = name
    }
}

extension MainTableViewCell {
    static var reuseID: String {
        return String(describing: self)
    }
}
