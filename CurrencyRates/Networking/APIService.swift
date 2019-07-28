//
//  APIService.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 27/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation

protocol APIServiceType {
    func request<T: Codable>(type: T.Type, endpoint: Endpoint, completion: @escaping (Result<T, NetworkError>) -> ())
}

final class APIService: APIServiceType {
    
    let session: URLSession!
    let transformer: Transformer!
    
    init(session: URLSession = URLSession(configuration: .default), transformer: JSONTransformer = JSONTransformer()) {
        self.session = session
        self.transformer = transformer 
    }
    
    func request<T: Codable>(type: T.Type, endpoint: Endpoint, completion: @escaping (Result<T, NetworkError>) -> ()) {
        
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.host
        components.path = endpoint.path
        components.queryItems = endpoint.parameters
        
        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        
        let task = session.dataTask(with: urlRequest) { (result) in
            switch result {
            case .success(let response, let data):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.invalidStatusCode))
                    return
                }
                do {
                    let values = try self.transformer.decode(T.self, from: data)
                    completion(.success(values))
                } catch {
                    completion(.failure(.decodeError))
                }
            case .failure(_):
                completion(.failure(.apiError))
            }
        }
        task.resume()
    }
}

enum NetworkError: String, Error {
    case invalidStatusCode = "bad status code"
    case decodeError = "decode error"
    case apiError = "api error"
}
