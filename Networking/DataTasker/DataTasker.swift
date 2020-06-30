//
//  DataTasker.swift
//  Networking
//
//  Created by Thomas Manos Bajis on 6/26/20.
//  Copyright © 2020 Thomas Manos Bajis. All rights reserved.
//

import Foundation

public protocol DataTasker {
    func dataTask(with request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: DataTasker { }
