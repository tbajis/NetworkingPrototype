//
//  Request.swift
//  Networking
//
//  Created by Thomas Manos Bajis on 6/26/20.
//  Copyright © 2020 Thomas Manos Bajis. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

public protocol HTTPRequest {
    associatedtype ResponseType: Response
    
    var url: String { get }
    var method: HTTPMethod { get }
    var parameters: [String] { get }
    var headers: [String: String] { get }
}
