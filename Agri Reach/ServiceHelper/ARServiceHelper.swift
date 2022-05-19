//
//  ServiceHelper.swift
//  Agri Reach
//
//  Created by Rafiudeen on 19/05/22.
//

import UIKit

enum ARFetchError: Error {
    case invalidURL
    case missingData
    case message(String)
    case inValidResponseFormat
    case offline(String)
    case unKnown
}

class ARServiceHelper {
    
    class func request<T: Codable>(router: ARServiceManager, completion: @escaping (Result<T, ARFetchError>) -> ()) {
        
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters
        
        guard let url = components.url else {
            completion(.failure(.inValidResponseFormat))
            return
        }
        print("URL===> ", url)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        
        //  HTTPCookieStorage.shared.cookies?.forEach(HTTPCookieStorage.shared.deleteCookie) // for use deleteCookie
        
        for (key, value) in router.headerFields {
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        if let data = router.body {
            urlRequest.httpBody = data
        }
        
        CommonServiceHelper.instance.request(forUrlRequest: urlRequest, completion: { (result : Result<Data, ARFetchError>) in
            
            DispatchQueue.main.async {
                
                switch result {
                    
                case .success(let data):
                    
                    do {
                        
                        if let dict = try JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as? [String : Any] {
                            
                            print("Response====> ", dict)
                            
                            if let responseObject = try? JSONDecoder().decode(T.self, from: data){
                                completion(.success(responseObject))
                                
                            }else {
                                completion(.failure(.inValidResponseFormat))
                            }
                            
                        }else {
                            completion(.failure(.inValidResponseFormat))
                        }
                        
                    }catch (let error) {
                        completion(.failure(.message(error.localizedDescription)))
                    }
                    
                case .failure(let message): completion(.failure(message))
                    
                }
            }
        })
    }
}
