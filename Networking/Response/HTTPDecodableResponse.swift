//
//  HTTPDecodableResponse.swift
//  Networking
//
//  Created by Thomas Manos Bajis on 6/26/20.
//  Copyright © 2020 Thomas Manos Bajis. All rights reserved.
//

import Foundation

public enum ParsingError: Error {
    case parsing(String)
}

public struct HTTPDecodableResponse<T: Decodable & HTTPResponseValidatable>: Response {
    public typealias OutputType = T
    public let response: OutputType
    
    public init(input: Data?, response: HTTPURLResponse) throws {
        guard T.isValid(response) else {
            throw ParsingError.parsing("response: \(response) is not valid")
        }
        
        guard let data = input else {
            throw ParsingError.parsing("No data returned in successful response")
        }
        
        self.response = try JSONDecoder().decode(T.self, from: data)
    }
}
