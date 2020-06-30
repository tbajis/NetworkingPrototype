//
//  DarkSkyRequest.swift
//  Networking
//
//  Created by Thomas Manos Bajis on 6/26/20.
//  Copyright © 2020 Thomas Manos Bajis. All rights reserved.
//

import Foundation

public struct DarkSkyRequest: HTTPRequest {
    public typealias ResponseType = HTTPDecodableResponse<NetworkResponse>
    
    public let url: String = "https://api.darksky.net"
    public let method: HTTPMethod = .get
    public let parameters: [String] = [
        "forecast",
        "KEY HERE",
        "37.8267,-122.4233"
    ]
    public let headers: [String : String] = [:]
    
    public init() {}
}
