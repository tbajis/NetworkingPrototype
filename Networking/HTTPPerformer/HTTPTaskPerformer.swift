//
//  HTTPTaskPerformer.swift
//  Networking
//
//  Created by Thomas Manos Bajis on 6/26/20.
//  Copyright © 2020 Thomas Manos Bajis. All rights reserved.
//

import Foundation

public class HTTPTaskPerformer: HTTPPerformer {
    
    let dataTasker: DataTasker
    
    public init(dataTasker: DataTasker = URLSession.shared) {
        self.dataTasker = dataTasker
    }
    
    public func send(url: String,
                     method: HTTPMethod,
                     parameters: [String] = [],
                     headers: [String: String] = [:],
                     completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        let request = URLRequestBuilder.create(host: url,
                                               method: method,
                                               parameters: parameters,
                                               headers: headers)
        
        let task = dataTasker.dataTask(with: request) { (data, response, error) in
            completion(data, response, error)
        }

        task.resume()
    }
}
