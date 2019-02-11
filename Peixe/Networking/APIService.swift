//
//  APIService.swift
//  Peixe
//
//  Created by Gabriel vieira on 2/9/19.
//  Copyright © 2019 Gabriel vieira. All rights reserved.
//

import Foundation

enum APIResult<T:Decodable> {
    case success(T)
    case failure(APIServiceError)
}

protocol ServiceProtocol {
    func request<T:Decodable>(_ request: APIBaseRequest, decodingType: T.Type,completion: @escaping (APIResult<T>) -> Void)
}

class APIService: ServiceProtocol {
    
    public func request<T:Decodable>(_ request: APIBaseRequest, decodingType: T.Type, completion: @escaping (APIResult<T>) -> Void) {

        guard let urlRequest = self.buildURLRequest(request) else {
            completion(.failure(.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.unknown(error.localizedDescription)))
            }

            guard let data = data else {
                completion(.failure(.brokenData))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.unknown("Could not cast to HTTPURLResponse object.")))
                return
            }
            
            switch httpResponse.statusCode {
            
                case 200...299:
                    
                    guard let obj = try? JSONDecoder().decode(decodingType, from: data) else {
                        completion(.failure(.couldNotParseObject))
                        return
                    }
                    
                    completion(.success(obj))

                case 403:
                    completion(.failure(.authenticationRequired))

                case 404:
                    completion(.failure(.couldNotFindHost))

                case 500:
                    completion(.failure(.badRequest))

                default: break
            }
            
        }.resume()
    }
    
    private func buildURLRequest(_ request: APIBaseRequest) -> URLRequest? {
        
        guard let url = URL(string: "\(APIConstants.BaseUrl)\(request.endpoint)") else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        if request.method == .post {
            
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: request.parameters, options: .prettyPrinted) 
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        for (key, value) in request.headers {
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        return urlRequest
    }
}
