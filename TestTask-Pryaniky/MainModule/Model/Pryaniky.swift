//
//  Pryaniky.swift
//  TestTask-Pryaniky
//
//  Created by admin on 18.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

struct Pryaniky: Decodable {
    //MARK: - Properties
    var data : [ArrayData]
    var view: [String]
}

struct ArrayData: Decodable {
    //MARK: - Properties
    var name: String
    var data: Data
}

struct Data: Decodable {
    //MARK: - Properties
    var text: String?
    var url: String?
    var selectedId: Int?
    var variants: [VariantsArray]?
}

struct VariantsArray: Decodable {
    //MARK: - Properties
    var id: Int?
    var text: String?
}
