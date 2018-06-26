//
//  APIConstants.swift
//  BurgerUA
//
//  Created by thejus manoharan on 16/06/2018.
//  Copyright © 2018 thejus. All rights reserved.
//

import Foundation
import SwiftyJSON

internal struct APIBasePath {
    
    //Server
    static let basePath = "https://bigburger.useradgents.com/"
    
    
}

internal struct APITypes {
    
    static let getAllData = "catalog" // burger Data
    
    
}

enum APIConstants:String {
    
    case success = "success"
    case message = "message"
}



enum Validate : String {
    
    case none
    case success = "1"
    case failure = "0"
    
    func map(response message : String?) -> String? {
        
        switch self {
            
        case .success:
            return message
            
        case .failure :
            return message
            
        default:
            return nil
        }
    }
}

enum Response {
    case success(JSON)
    case failure(String?)
}

typealias OptionalDictionary = [String : Any]?


