//
//  Pryaniky.swift
//  TestTask-Pryaniky
//
//  Created by admin on 18.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

struct Pryaniky: Decodable {
    var data : [ArrayData]
    var view: [String]
}

struct ArrayData: Decodable {
    var name: String
    var data: Data
}

struct Data: Decodable {
    var text: String?
    var url: String?
    var selectedId: Int?
    var variants: [VariantsArray]?
}

struct VariantsArray: Decodable {
    var id: Int?
    var text: String?
}
