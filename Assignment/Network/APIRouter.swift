//
//  APIRouter.swift
//  Assignment
//
//  Created by Dileep vasa on 21/11/21.
//

import Alamofire
import Foundation

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case ocpApimSubscriptionKey = "Ocp-Apim-Subscription-Key"
}

// Custom Error object API Calls.
enum APIError: Error {
    case runtimeError(String)
}

// Request parameter types.
enum RequestParams {
    case body(_:Parameters)
}

enum ContentType: String {
    case json = "application/json"
}

/// Builds the URLRequest object.
enum APIRouter: URLRequestConvertible {
    case getFilghtInformation(fromDate: String, toDate: String, origin: String, destination: String)
    
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .getFilghtInformation:
            return .get
        }
    }
    
    // MARK: - url
    private var urlPath: String {
        switch self {
        case let .getFilghtInformation(fromDate: fromDate,toDate: toDate, origin: origin, destination: destination):
            let url = Constants.domain + "flights/?fromDate=\(fromDate)&toDate=\(toDate)&origin=\(origin)&destination=\(destination)&nonStopOnly=false"
            return url
        }
    }
    
    // MARK: - Parameters
    private var parameters: RequestParams? {
        switch self {
        case .getFilghtInformation:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try urlPath.asURL()
        var urlRequest = URLRequest(url: url)
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Headers
        switch self {
        case .getFilghtInformation:
            var headers = [String: String]()
            headers[HTTPHeaderField.contentType.rawValue] = ContentType.json.rawValue
            headers[HTTPHeaderField.ocpApimSubscriptionKey.rawValue] = Constants.ocpApimSubscriptionKey
            urlRequest.allHTTPHeaderFields = headers
        }
        
        // Parameters
        if let parameters = parameters {
            switch parameters {
            case .body(let params):
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            }
        }
        return urlRequest
    }
}
