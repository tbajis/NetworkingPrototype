//
//  Client+Future.swift
//  Networking
//
//  Created by Thomas Manos Bajis on 6/26/20.
//  Copyright © 2020 Thomas Manos Bajis. All rights reserved.
//

import Foundation
import Combine

public extension Client {
    func send<R: HTTPRequest>(_ request: R) -> AnyPublisher<R.ResponseType, ClientError> {
        return Future { completion in
            self.send(request) { (result) in
                switch result {
                case .success(let response):
                    return completion(.success(response))
                case .failure(let clientError):
                    return completion(.failure(clientError))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
