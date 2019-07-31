//
//  APIService.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 27/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation

protocol APIServiceType {
    func request(endpoint: Endpoint, completion: @escaping (Result<[String: Any], NetworkError>) -> ())
    func buildRequest(for endpoint: Endpoint) -> URLRequest?
}

final class APIService: APIServiceType {
    
    // MARK: Private properties
    
    private let session: URLSession!
    
    // MARK: - Init
    
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    // MARK: - Public methods
    
    func request(endpoint: Endpoint, completion: @escaping (Result<[String: Any], NetworkError>) -> ()) {
        
        guard var urlRequest = buildRequest(for: endpoint) else { return }
        urlRequest.httpMethod = endpoint.method
        
        let task = session.dataTask(with: urlRequest) { (result) in
            switch result {
            case .success(let response, let data):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.invalidStatusCode))
                    return
                }
                do {
                    let values = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    if let values = values {
                        completion(.success(values))
                    }
                } catch {
                    completion(.failure(.decodeError))
                }
            case .failure(_):
                completion(.failure(.apiError))
            }
        }
        task.resume()
    }
    
    func buildRequest(for endpoint: Endpoint) -> URLRequest? {
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.host
        components.path = endpoint.path
        components.queryItems = endpoint.parameters
        guard let url = components.url else { return nil }
        return URLRequest(url: url)
    }
}

enum NetworkError: String, Error {
    case invalidStatusCode = "bad status code"
    case decodeError = "decode error"
    case apiError = "api error"
}
