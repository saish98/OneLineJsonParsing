//
//  Pokemon.swift
//  TestApiCall
//
//  Created by Heady on 17/01/18.
//  Copyright © 2018 Heady. All rights reserved.
//

import Foundation
import Alamofire

class Address: Decodable {
    
    let ip: String
   
    var description: String {
        return "\(ip)"
    }
}
