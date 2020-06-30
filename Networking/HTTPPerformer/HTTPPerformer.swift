//
//  HTTPPerformer.swift
//  Networking
//
//  Created by Thomas Manos Bajis on 6/26/20.
//  Copyright © 2020 Thomas Manos Bajis. All rights reserved.
//

import Foundation

public protocol HTTPPerformer {
    func send(
        url: String,
        method: HTTPMethod,
        parameters: [String],
        headers: [String: String],
        completion: @escaping (Data?, URLResponse?, Error?) -> Void
    )
}

public extension HTTPPerformer {
    func send<R: HTTPRequest>(request: R,
                              tasker: DataTasker,
                              completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        send(url: request.url,
             method: request.method,
             parameters: request.parameters,
             headers: request.headers,
             completion: completion)
    }
}
