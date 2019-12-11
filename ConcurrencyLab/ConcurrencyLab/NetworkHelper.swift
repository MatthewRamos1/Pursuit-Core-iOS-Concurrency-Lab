//
//  NetworkHelper.swift
//  ConcurrencyLab
//
//  Created by Matthew Ramos on 12/11/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import Foundation

class NetworkHelper {
    
    static let shared = NetworkHelper()
    private var session: URLSession
    
    private init() {
        session = URLSession(configuration: .default)
    }
    
    func performDataTask(with urlString: String, completion: @escaping (Result<Data,AppError>) -> ()) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL(urlString)))
            return
        }
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            if let netError = error {
                completion(.failure(.networkClientError(netError)))
            }
            guard let urlResponse = response as? HTTPURLResponse else {
                completion(.failure(.noResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            switch urlResponse.statusCode {
            case 200...299: break // everything went well here
            default:
                completion(.failure(.badStatusCode(urlResponse.statusCode)))
                return
            }
            completion(.success(data))
        }
        dataTask.resume()
    }
}
