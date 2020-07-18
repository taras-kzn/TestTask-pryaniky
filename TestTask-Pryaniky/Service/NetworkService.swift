//
//  NetworkService.swift
//  TestTask-Pryaniky
//
//  Created by admin on 18.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

//MARK: - Protocol
protocol NetworkServiceProtocol {
    func getData(completion: @escaping (Result<Pryaniky?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    //MARK: - Funcction Get
    func getData(completion: @escaping (Result<Pryaniky?, Error>) -> Void) {
        let urlString = "https://pryaniky.com/static/json/sample.json"
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data,_ , error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let obj = try JSONDecoder().decode(Pryaniky.self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}


