//
//  Network.swift
//  TestApiCall
//
//  Created by Heady on 17/01/18.
//  Copyright © 2018 Heady. All rights reserved.
//

import Foundation
import Alamofire

class Network {
    
    static func getIPAddress(from api: String, url: String,completion: @escaping Constants.CompletionHandler, failure: @escaping Constants.FailureHandler) {
        
        print("#### API Request:\(api) URL:\(url)")
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
        
            if err == nil {
//                guard let data = data else { return }
                do {
                    //One line JSON parsing, No need of init function, Just meke Entity class Decodable
                    let address = try JSONDecoder().decode(Address.self, from: data!)
                    print("#### API Response:\(api) Data:\(address.description)")
                    completion(address)
                    
                } catch let jsonErr {
                    print("#### API Response:\(api) Error:\(jsonErr.localizedDescription)")
                    failure(401, jsonErr)
                }
                
            }else {
                print("#### API Response:\(api) Error:\(String(describing: err?.localizedDescription))")
                failure(401, err!)
            }
            }.resume()
    }
    
    static func getIPAddressFromAlamofire(from api: String, url: String, completion: @escaping Constants.CompletionHandler, failure: @escaping Constants.FailureHandler) {
        
        print("#### API Request:\(api) URL:\(url)")
        Alamofire.request(url).responseJSON { (response) in
            
            if response.result.error == nil {
//                guard let data = response.data else { return }
                do {
                    let address = try JSONDecoder().decode(Address.self, from:response.data!)
                    print("#### API Response:\(api) Data:\(address.description)")
                    completion(address)
                    
                }catch let jsonErr {
                    print("#### API Response:\(api) Error:\(jsonErr.localizedDescription)")
                    failure(401, jsonErr)
                }
                
            }else {
                print("#### API Response:\(api) Error:\(String(describing: response.result.error?.localizedDescription))")
                failure(401, response.result.error!)
            }
        }
    }
}
