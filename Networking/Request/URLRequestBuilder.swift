//
//  URLRequestBuilder.swift
//  Networking
//
//  Created by Thomas Manos Bajis on 6/26/20.
//  Copyright © 2020 Thomas Manos Bajis. All rights reserved.
//

import Foundation

public enum URLRequestBuilder {
    static func create(host: String,
                       method: HTTPMethod,
                       parameters: [String],
                       headers: [String: String]) -> URLRequest {
        let url = URL(string: host + "/" + parameters.joined(separator: "/"))!
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        
        return request
    }
}
