//
//  Response.swift
//  Networking
//
//  Created by Thomas Manos Bajis on 6/26/20.
//  Copyright © 2020 Thomas Manos Bajis. All rights reserved.
//

import Foundation

public protocol Response {
    associatedtype OutputType
    
    init(input: Data?, response: HTTPURLResponse) throws
}

public protocol HTTPResponseValidatable {
    static var isValid: (HTTPURLResponse) -> Bool { get }
}
