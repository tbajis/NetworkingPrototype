//
//  Client.swift
//  Networking
//
//  Created by Thomas Manos Bajis on 6/26/20.
//  Copyright © 2020 Thomas Manos Bajis. All rights reserved.
//

import Foundation

public enum ClientError: Error {
    case malformedResponse(Error)
    case networkError(Error)
}

public class Client {
    public let httpPerformer: HTTPPerformer
    private let dataTasker: DataTasker
    
    public init(httpPerformer: HTTPPerformer = HTTPTaskPerformer(),
                dataTasker: DataTasker = URLSession.shared) {
        self.httpPerformer = httpPerformer
        self.dataTasker = dataTasker
    }
    
    public func send<R: HTTPRequest>(_ request: R,
                                     completion: @escaping (Result<R.ResponseType, ClientError>) -> Void) {
        httpPerformer.send(request: request, tasker: dataTasker) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.networkError(error)))
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                // we should be dealing with http or we're in trouble
                fatalError("Should be HTTPURLResponse")
            }
            
            do {
                let output = try R.ResponseType(input: data, response: httpResponse)
                return completion(.success(output))
            } catch {
                return completion(.failure(.malformedResponse(error)))
            }
        }
    }
}
