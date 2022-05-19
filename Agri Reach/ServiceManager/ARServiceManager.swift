//
//  ARServiceManager.swift
//  Agri Reach
//
//  Created by Rafiudeen on 19/05/22.
//

import Foundation

struct API {
    static var baseURL = ""
    static var scheme = ""
    static var path = ""
    static var port = 0
}

enum HttpMethod: String {
    case get
    case post
    case put
    case patch
    case delete
}

enum ContentType : String {
    case formData = "multipart/form-data"
    case json = "application/json"
    case x_www_form_urlEncoded = "application/x-www-form-urlencoded"
}

enum ARServiceManager {
    
    case basecase(request: BaseRequest)
    
    var scheme: String {
        switch self {
        case .basecase: return API.scheme
        }
    }
    
    var host: String {
        switch self {
        case .basecase: return API.baseURL
        }
    }
    
    var port: Int {
        switch self {
        case .basecase: return API.port
        }
    }
    
    var path: String {
        switch self {
        case .basecase: return API.path + "/"
        }
    }
    
    var method: String {
        switch self {
        case .basecase: return HttpMethod.post.rawValue
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .basecase:
            return nil
        }
    }
    
    var body: Data? {
        switch self {
        case .basecase(let request):
            print(request)
            let encoder = JSONEncoder()
            return try? encoder.encode(request)
        }
    }
    
    var formDataParameters : [String : Data]? {
        switch self {
        case .basecase: return nil
        }
    }
    
    var headerFields: [String : String] {
        switch self {
        case .basecase: return ["Content-Type" : ContentType.json.rawValue]
        }
    }
}
