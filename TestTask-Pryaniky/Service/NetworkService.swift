//
//  NetworkService.swift
//  TestTask-Pryaniky
//
//  Created by admin on 18.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

//MARK: - Protocol
protocol NetworkServiceProtocol {
    func getData(completion: @escaping (Result<Pryaniky?, Error>) -> Void)
    func downloadImage(url: String?, completion: @escaping(UIImage?) -> Void)
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
            guard let data = data else {
                return
            }
            do {
                let obj = try JSONDecoder().decode(Pryaniky.self, from: data)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    //MARK: - Function Image
    func downloadImage(url: String?, completion: @escaping(UIImage?) -> Void) {
        guard let urlImage = url,
            let url = URL(string: urlImage)  else {
                return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let dataImage = data else {return}
            let image = UIImage(data: dataImage)
            completion(image)
        }.resume()
    }
}


