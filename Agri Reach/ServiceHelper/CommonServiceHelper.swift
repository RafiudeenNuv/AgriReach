//
//  CommonServiceHelper.swift
//  Agri Reach
//
//  Created by Rafiudeen on 19/05/22.
//

import UIKit

enum StatusCode: Int {
    case success = 200
    case unAuthorized = 401
    case internalServerError = 500
    
}

class CommonServiceHelper: NSObject {
    
    static let instance = CommonServiceHelper()
    
    public func request(forUrlRequest urlRequest: URLRequest, completion: @escaping (Result<Data, ARFetchError>) -> ()) {
        
        let session = URLSession(configuration: .default)
        
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            self.processResponse(urlRequest: urlRequest, data: data, response: response, error: error, completion: completion)
        }
        dataTask.resume()
        
    }
    
    private func processResponse(urlRequest: URLRequest, data: Data?, response: URLResponse?, error: Error?, completion : @escaping (Result<Data, ARFetchError>) -> ()) {
        
        guard error == nil else {
            
            if let errorDesc = error?.localizedDescription {
                completion(.failure(.message("HTTP Request Failed \(errorDesc)")))
            }
            return
        }
        
        guard response != nil else {
            completion(.failure(.inValidResponseFormat))
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse, let statusCode = StatusCode(rawValue: httpResponse.statusCode) else {
            completion(.failure(.inValidResponseFormat))
            return
        }
        
        switch statusCode {
            
        case .success:
            
            guard let _data = data else {
                completion(.failure(.missingData))
                return
            }
            
            completion(.success(_data))
            
        case .unAuthorized, .internalServerError:
            
            guard let _ = data else {
                completion(.failure(.message("InternalServerError")))
                return
            }
        }
    }
}
