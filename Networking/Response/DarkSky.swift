//
//  DarkSky.swift
//  Networking
//
//  Created by Thomas Manos Bajis on 6/26/20.
//  Copyright © 2020 Thomas Manos Bajis. All rights reserved.
//

import Foundation

public struct NetworkResponse: Decodable {
    public struct DailyResponse: Decodable {
        let summary: String
        let icon: String
        let data: [DataResponse]
        
    }
    
    public struct DataResponse: Decodable {
        let time: Double
        let summary: String
        let icon: String
        
    }
    
   public let latitude: Double
   public let longitude: Double
   public let timezone: String
   public let daily: DailyResponse
}

extension NetworkResponse: HTTPResponseValidatable {    
    public static var isValid: (HTTPURLResponse) -> Bool = { $0.statusCode == 200 }
}
