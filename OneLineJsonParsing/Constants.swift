//
//  Constant.swift
//  TestApiCall
//
//  Created by Heady on 17/01/18.
//  Copyright © 2018 Heady. All rights reserved.
//

import Foundation

struct Constants {

    typealias CompletionHandler = (_ address: Address) -> Void
    typealias FailureHandler = (_ code: Int, _ error: Error) -> Void
    
    struct ApiName {
        static let getIP = "Get IP"
    }
    struct EndPoint {
        static let debugURL =  "http://ip.jsontest.com"
    }
}
